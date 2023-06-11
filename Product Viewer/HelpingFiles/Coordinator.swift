//
//  Coordinator.swift
//  Product Viewer
//
//  Created by Mohamed Mostafa on 11/06/2023.
//

import UIKit
import RxSwift

class Coordinator {
    private let disposeBag = DisposeBag()
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
