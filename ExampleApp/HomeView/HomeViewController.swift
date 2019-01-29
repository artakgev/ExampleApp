//
//  HomeViewController.swift
//  ExampleApp
//
//  Created by Gevorgyan, Artak on 28/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!

    private lazy var dataManager = {
        return DataManager()
    }()
    
    var viewModel: ArticlesTableViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - View life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicatorView.color = UIColor.Common.activityIndicatorColor
        self.activityIndicatorView.hidesWhenStopped = true
        self.tableView.backgroundColor = UIColor.TableView.bgColor
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if appDelegate.articlesData == nil {
            self.activityIndicatorView.startAnimating()
            dataManager.fetchArticles { (response, error) in
                self.activityIndicatorView.stopAnimating()
                if error == nil {
                    appDelegate.articlesData = response
                    self.viewModel = ArticlesTableViewModel(articlesData: response!)
                }
            }
        } else {
            self.viewModel = ArticlesTableViewModel(articlesData: appDelegate.articlesData!)
        }
    }
    
    // MARK: - View methods
    
    private func updateView() {
        tableView.refreshControl?.endRefreshing()
        
        if let _ = viewModel {
            self.tableView.reloadData()
        } else {
            // ERROR case
        }
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.viewModel?.articlesData.count {
            return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? ArticlesTableViewCell else { fatalError("Unexpected Table View Cell") }
        if let viewModel = viewModel {
            cell.titleLabel.text = viewModel.articleTitle(for: indexPath.row)
            cell.dateLabel.text = viewModel.articleDate(for: indexPath.row)
            cell.thumbnailImageView.kf.setImage(with: viewModel.articleThumbnailURL(for: indexPath.row))
        }
        return cell
    }
}


