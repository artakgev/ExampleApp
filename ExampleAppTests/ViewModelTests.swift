//
//  ExampleAppTests.swift
//  ExampleAppTests
//
//  Created by Gevorgyan, Artak on 28/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import XCTest
@testable import ExampleApp

class ViewModelTests: XCTestCase {

    var articleInfoResponce: ArticleInfoResponse?
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func testArticlesTableViewModel() {
        self.getArticles()
        let articleData = articleInfoResponce?.articleInfo.articleData
        guard let data = articleData else { return }
        let articlesTableViewModel = ArticlesTableViewModel.init(articlesData: data)
        XCTAssertEqual(articlesTableViewModel.articleTitle(for: 0), "Test headline", "ArticleData headline mismatch")
        XCTAssertEqual(articlesTableViewModel.articleDate(for: 0), "2019-01-12T16:00:05Z", "ArticleData date mismatch")
    }
    
    func getArticles() {
        let jsonString = """
                        {
                        "response": {
                        "status": "ok",
                        "results": [
                        {
                        "id": "science/2019/jan/12/psychology-of-group-reasoning-versus-individual",
                        "type": "article",
                        "sectionName": "Science",
                        "webPublicationDate": "2019-01-12T16:00:05Z",
                        "fields": {
                        "headline": "Test headline",
                        "trailText": "Test trail text",
                        "body": "Three times when you should never send a text: when you're high, when you're lonely, and when you're Grandma.",
                        "thumbnail": "https://media.guim.co.uk/a7138ce7589115906480234538fe1f697c1c0a16/0_72_1200_720/500.jpg"
                        },
                        "tags": [{
                        "webTitle": "Psychology",
                        },
                        {
                        "webTitle": "Science",
                        }]
                        }
                        ]
                        }
                        }
                        """
        if let jsonData = jsonString.data(using: .utf8) {
            articleInfoResponce = try? JSONDecoder().decode(ArticleInfoResponse.self, from: jsonData)
        }
    }
    
    func testMenuTableViewHomeModel() {
        let viewModel = MenuTableViewModel.init(menuCellType: MenuCellType.home)
        XCTAssertNotNil(viewModel, "MenuTableViewModel should not be nil")
        XCTAssertEqual(viewModel.menuCellType, MenuCellType.home, "Invalid cell type")
        XCTAssertEqual(viewModel.icon, UIImage.MenuItems.homeImage, "Invalid icon")
        XCTAssertEqual(viewModel.text, "All Channels", "Invalid text")
    }
    
    func testMenuTableViewSubscriptionsModel() {
        let viewModel = MenuTableViewModel.init(menuCellType: MenuCellType.subscriptions)
        XCTAssertNotNil(viewModel, "MenuTableViewModel should not be nil")
        XCTAssertEqual(viewModel.menuCellType, MenuCellType.subscriptions, "Invalid cell type")
        XCTAssertEqual(viewModel.icon, UIImage.MenuItems.subscriptionsImage, "Invalid icon")
        XCTAssertEqual(viewModel.text, "Subscriptions", "Invalid text")
    }
    
    func testMenuTableViewSettingsModel() {
        let viewModel = MenuTableViewModel.init(menuCellType: MenuCellType.settings)
        XCTAssertNotNil(viewModel, "MenuTableViewModel should not be nil")
        XCTAssertEqual(viewModel.menuCellType, MenuCellType.settings, "Invalid cell type")
        XCTAssertEqual(viewModel.icon, UIImage.MenuItems.settingsImage, "Invalid icon")
        XCTAssertEqual(viewModel.text, "Settings", "Invalid text")
    }
    
    func testMenuTableViewAboutModel() {
        let viewModel = MenuTableViewModel.init(menuCellType: MenuCellType.about)
        XCTAssertNotNil(viewModel, "MenuTableViewModel should not be nil")
        XCTAssertEqual(viewModel.menuCellType, MenuCellType.about, "Invalid cell type")
        XCTAssertEqual(viewModel.icon, UIImage.MenuItems.aboutImage, "Invalid icon")
        XCTAssertEqual(viewModel.text, "About", "Invalid text")
    }

    func testMenuTableViewDisconnectTVBoxModel() {
        let viewModel = MenuTableViewModel.init(menuCellType: MenuCellType.disconnectTVBox)
        XCTAssertNotNil(viewModel, "MenuTableViewModel should not be nil")
        XCTAssertEqual(viewModel.menuCellType, MenuCellType.disconnectTVBox, "Invalid cell type")
        XCTAssertEqual(viewModel.icon, UIImage.MenuItems.disconnectTVBoxImage, "Invalid icon")
        XCTAssertEqual(viewModel.text, "Disconnect TV Box", "Invalid text")
    }

    func testMenuTableViewLogoutModel() {
        let viewModel = MenuTableViewModel.init(menuCellType: MenuCellType.logout)
        XCTAssertNotNil(viewModel, "MenuTableViewModel should not be nil")
        XCTAssertEqual(viewModel.menuCellType, MenuCellType.logout, "Invalid cell type")
        XCTAssertEqual(viewModel.icon, UIImage.MenuItems.logoutImage, "Invalid icon")
        XCTAssertEqual(viewModel.text, "Logout", "Invalid text")
    }

}
