//
//  MainViewModel.swift
//  Product Viewer
//
//  Created by Mohamed Mostafa on 11/06/2023.
//

import Foundation

import Foundation
import RxSwift
import RxCocoa

class MainViewModel {
    
    private var coreDataManager = CoreDataManager()
    let productCoreData = PublishSubject<[ProductCoreData]>()
    
    let disposeBag = DisposeBag()
    let selectedItem = PublishSubject<ProductCoreData>()
    
    
    
    func viewDidLoad() {
        getDataFromApi()
        
    }
    
    func getStoredData() {
        productCoreData.onNext(coreDataManager.fetchProducts())
    }
    
    func getDataFromApi() {
        guard let url = URL(string: "https://www.nweave.com/wp-content/uploads/2012/09/featured.txt") else { return }
        let request = APIRequest<[Products]>(url: url)

        request.execute().subscribe(onNext: { [weak self] products in
            guard let self = self else { return }
            self.coreDataManager.deleteAllProducts()
            for product in products {
                self.coreDataManager.addProduct(title: product.product?.name, price: product.product?.price, description: product.product?.description, imageUrl: product.product?.image_url)
            }
            let products = self.coreDataManager.fetchProducts()
            self.productCoreData.onNext(products)
            
            self.downloadProductsImages(downloadedProducts: products)
            }, onError: { error in
                // handle error
                print(".................................")
                print(error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    private func downloadProductsImages(downloadedProducts: [ProductCoreData]) {
        for product in downloadedProducts {
            let url = URL(string: product.imageUrl!)
            do {
                let data = try Data(contentsOf: url!)
                product.image = data
                coreDataManager.saveContext()
                let products = self.coreDataManager.fetchProducts()
                self.productCoreData.onNext(products)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

}
