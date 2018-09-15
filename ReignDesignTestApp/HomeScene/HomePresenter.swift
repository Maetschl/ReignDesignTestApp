//
//  HomePresenter.swift
//  ReignDesignTestApp
//
//  Created by Julián Arias on 15-09-18.
//  Copyright (c) 2018 Maetschl. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates: http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic {
    func presentSomething(response: Home.News.Response)
}

class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?

    // MARK: Do something

    func presentSomething(response: Home.News.Response) {
        let viewModel = Home.News.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
