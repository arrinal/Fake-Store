//
//  StoreInteractor.swift
//  Fake Store
//
//  Created by Arrinal Sholifadliq on 13/07/22.
//

import Foundation
import SwiftyJSON

protocol StoreInteractorProtocol {
    
    var productData: [ProductData] { get set }
    var isPaginating: Bool { get set }
    
    func getData() -> [ProductData]
    func fetchProduct(pagination: Bool, completion: @escaping ()->())
    func getPaginatingStatus() -> Bool
    
}

class StoreInteractor: StoreInteractorProtocol {
    
    var productData = [ProductData]()
    var isPaginating = false
    var lastProductIDFetched = Int()
    
    func getData() -> [ProductData] {
        productData
    }
    
    func fetchProduct(pagination: Bool, completion: @escaping ()->()) {
        
        
        if pagination {
            isPaginating = true
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2), execute: { [self] in
            
            if isPaginating == false {
                let source = "https://fakestoreapi.com/products"
                let url = URL(string: source)!
                let session = URLSession(configuration: .default)
        
                session.dataTask(with: url) { data, _, error in
        
                    if error != nil {
                        print((error?.localizedDescription)!)
                        return
        
                    }

                    if let productData = try? JSON(data: data!) {
                        for product in productData {
                            let id = product.1["id"].intValue
                            let title = product.1["title"].stringValue
                            let price = product.1["price"].intValue
                            let description = product.1["description"].stringValue
                            let image = product.1["image"].stringValue
                            let rating = product.1["rating"]["rate"].intValue
                            
                            if id > 4 {
                                break
                            }
        
                            DispatchQueue.main.async {
                                self.productData += [ProductData(id: id, title: title, price: price, description: description, image: image, rating: "\(rating)")]
                            }
                            
                            
                        }
                    }
                    
                    DispatchQueue.main.async {
                        completion()
                    }
        
                }.resume()
            } else {
                
                let source = "https://fakestoreapi.com/products"
                let url = URL(string: source)!
                let session = URLSession(configuration: .default)
        
                session.dataTask(with: url) { data, _, error in
        
                    if error != nil {
                        print((error?.localizedDescription)!)
                        return
        
                    }

                    if let productData = try? JSON(data: data!) {
                        
                        for product in productData {
                            let id = product.1["id"].intValue
                            let title = product.1["title"].stringValue
                            let price = product.1["price"].intValue
                            let description = product.1["description"].stringValue
                            let image = product.1["image"].stringValue
                            let rating = product.1["rating"]["rate"].intValue
                            
                            if id <= 4 {
                                continue
                            }
                            
                            guard id > self.lastProductIDFetched else {
                                completion()
                                break
                            }
        
                            DispatchQueue.main.async {
                                self.productData += [ProductData(id: id, title: title, price: price, description: description, image: image, rating: "\(rating)")]
                                self.lastProductIDFetched = id
                            }
                            
                            
                        }
                    }
                    
                    DispatchQueue.main.async {
                        completion()
                    }
        
                }.resume()
            }
                    
            if pagination {
                self.isPaginating = false
            }
        })
    }
    
    func getPaginatingStatus() -> Bool {
        isPaginating
    }
}
