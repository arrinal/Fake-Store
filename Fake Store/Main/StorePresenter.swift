//
//  StorePresenter.swift
//  Fake Store
//
//  Created by Arrinal Sholifadliq on 13/07/22.
//

import Foundation

protocol StorePresenterProtocolInput {
    var interactor: StoreInteractorProtocol! { get set }
    
    func getData() -> [ProductData]
    func fetchProduct(pagination: Bool, completion: @escaping ()->())
    func getPaginatingStatus() -> Bool
}

class StorePresenter: StorePresenterProtocolInput {
    
    var interactor: StoreInteractorProtocol!
    
    func getData() -> [ProductData] {
        interactor.getData()
    }
    
    func fetchProduct(pagination: Bool, completion: @escaping ()->()) {
        interactor.fetchProduct(pagination: pagination, completion: completion)
    }
    
    func getPaginatingStatus() -> Bool {
        interactor.getPaginatingStatus()
    }
}
