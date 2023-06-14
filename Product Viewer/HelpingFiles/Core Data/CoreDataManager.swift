//
//  CoreDataManager.swift
//  Product Viewer
//
//  Created by Mohamed Mostafa on 14/06/2023.
//

import UIKit
import CoreData

class CoreDataManager {
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Product Viewr")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        return container
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext() {
        guard viewContext.hasChanges else { return }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addProduct(title: String?, price: String?, description: String?, imageUrl: String?) {
        let newProduct = ProductCoreData(context: self.viewContext)
        newProduct.title = title
        newProduct.descriptions = description
        newProduct.price = price
        newProduct.imageUrl = imageUrl
        saveContext()
    }
    
    func fetchProducts() -> [ProductCoreData] {
        let fetchRequest: NSFetchRequest<ProductCoreData> = ProductCoreData.fetchRequest()
        var products = [ProductCoreData]()
        do {
            products = try viewContext.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch tasks: \(error)")
        }
        return products
    }
    
    func deleteAllProducts() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ProductCoreData")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try viewContext.execute(deleteRequest)
        } catch {
            fatalError("Failed to delete tasks: \(error)")
        }
    }
}
