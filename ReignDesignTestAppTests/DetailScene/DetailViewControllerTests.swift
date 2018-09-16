//
//  DetailViewControllerTests.swift
//  ReignDesignTestApp
//
//  Created by Julián Arias on 16-09-18.
//  Copyright (c) 2018 Maetschl. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import ReignDesignTestApp
import XCTest

class DetailViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: DetailViewController!
    var window: UIWindow!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupDetailViewController()
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: Test setup
    
    func setupDetailViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    }

    func loadView() {
        var dataStore = sut.router?.dataStore
        dataStore?.url = URL(string: Configurations.baseUrl)!
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: Test doubles

    class DetailBusinessLogicSpy: DetailBusinessLogic {
        var getUrlWasCalled = false
        func getUrl() {
            getUrlWasCalled = true
        }
    }

    // MARK: Tests

    func testShouldDoSomethingWhenViewIsLoaded() {
        // Given
        let spy = DetailBusinessLogicSpy()
        sut.interactor = spy

        // When
        loadView()

        // Then
        XCTAssertTrue(spy.getUrlWasCalled)
    }

    func testDisplaySomething() {
        // Given
        let viewModel = Detail.WebView.ViewModel(url: URL(string: Configurations.baseUrl)!)

        // When
        loadView()
        sut.displayWeb(viewModel: viewModel)

        // Then
        XCTAssertNotNil(sut.webView.url)
    }
}
