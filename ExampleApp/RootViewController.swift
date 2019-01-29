//
//  RootViewController.swift
//  PMP
//
//  Created by Gevorgyan, Artak on 28/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var menuPlaceholderView: UIView!
    @IBOutlet weak var constraintMenuLeft: NSLayoutConstraint!
    @IBOutlet weak var constraintMenuWidth: NSLayoutConstraint!
    @IBOutlet var activeViewContainer: UIView!
    
    var menuViewController: MenuViewController!
    
    private var activeViewController: UINavigationController? {
        didSet {
            removeInactiveViewController(inactiveViewController: oldValue)
            updateActiveViewController()
        }
    }
    
    private let segueMenuView = "SegueMenuView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintMenuLeft.constant = -constraintMenuWidth.constant
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =
            storyboard.instantiateViewController(withIdentifier: "homeViewNavID") as! UINavigationController
        activeViewController = viewController
        updateActiveViewController()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case segueMenuView:
            
            if let menuViewController = segue.destination as? MenuViewController {
                self.menuViewController = menuViewController
                self.menuViewController.delegate = self
            }
        default: break
        }
    }

    @IBAction func gestureTap(_ sender: UITapGestureRecognizer) {
        self.hideMenu()
    }
    
    func hideMenu() {
        constraintMenuLeft.constant = -constraintMenuWidth.constant
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (complete) in
        })
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if isViewLoaded {
            if let inActiveVC = inactiveViewController {
                inActiveVC.willMove(toParent: nil)
                inActiveVC.view.removeFromSuperview()
                inActiveVC.removeFromParent()
            }
        }else{
            print("-- removeInactiveViewController: view is NOT loaded")
        }
    }
    
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            addChild(activeVC)
            let barButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"),
                            style:  UIBarButtonItem.Style.plain,
                            target: self,
                            action: #selector(self.barButtonItemClicked))
            barButton.tintColor = UIColor.Common.menuItemsTint
            activeViewController?.children.first?.navigationItem.setLeftBarButton(barButton,
                                                                                                animated: false)
            activeViewContainer.addSubview(activeVC.view)
            activeVC.view.frame = activeViewContainer.bounds
            
            activeVC.didMove(toParent: self)
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func barButtonItemClicked() {
        constraintMenuLeft.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (complete) in
        })

    }

}

extension RootViewController: MenuViewControllerDelegate {
    func open(viewController: UINavigationController) {
        self.activeViewController = viewController
        self.hideMenu()
    }
}

extension RootViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return constraintMenuLeft.constant == 0
    }

}


