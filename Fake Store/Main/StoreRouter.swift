//
//  StoreRouter.swift
//  Fake Store
//
//  Created by Arrinal Sholifadliq on 13/07/22.
//

import Foundation
import UIKit

protocol StoreRouterProtocol {
    static func start() -> UIViewController
}

class StoreRouter: StoreRouterProtocol {
    
    static func start() -> UIViewController {
        
        let view = StoreView()
        let presenter = StorePresenter()
        let interactor = StoreInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        
        return view
    }
    
}
