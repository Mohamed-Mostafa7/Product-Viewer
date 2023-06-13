//
//  Product.swift
//  Product Viewer
//
//  Created by Mohamed Mostafa on 12/06/2023.
//

import Foundation

struct Products : Codable {
    let product : Product?

    enum CodingKeys: String, CodingKey {
        case product = "Product"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        product = try values.decodeIfPresent(Product.self, forKey: .product)
    }

}


struct Product : Codable {
    
    let name : String?
    let description : String?
    let price : String?
    let image_url : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case description = "description"
        case price = "price"
        case image_url = "image_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
    }

}
