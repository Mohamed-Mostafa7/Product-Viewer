//
//  MainViewModel.swift
//  Product Viewer
//
//  Created by Mohamed Mostafa on 11/06/2023.
//

import Foundation

import Foundation
import RxSwift

class MainViewModel {
    let products = PublishSubject<[String]>()
    let selectedItem = PublishSubject<String>()
    
    func viewDidLoad() {
        addProductToProducts()
    }
    
    func addProductToProducts() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.products.onNext(["Item 1", "Item 2", "Item 3","Item 1", "Item 2", "Item 3","Item 1", "Item 2", "Item 3","Item 1", "Item 2", "Item 3","Item 1", "Item 2", "Item 3"])
        }
    }
    
}
