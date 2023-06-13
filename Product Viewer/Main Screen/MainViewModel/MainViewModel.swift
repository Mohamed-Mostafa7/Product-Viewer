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
    let disposeBag = DisposeBag()
    let products = PublishSubject<[Products]>()
    let selectedItem = PublishSubject<Product>()
    
    func viewDidLoad() {
        getDataFromApi()
//        addProductToProducts()
    }
    
    func getDataFromApi() {
        guard let url = URL(string: "https://www.nweave.com/wp-content/uploads/2012/09/featured.txt") else { return }
        let request = APIRequest<[Products]>(url: url)

        request.execute().subscribe(onNext: { products in
            
            self.products.onNext(products)
            }, onError: { error in
                // handle error
                print(".................................")
                print(error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
}
