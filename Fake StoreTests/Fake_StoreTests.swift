//
//  Fake_StoreTests.swift
//  Fake StoreTests
//
//  Created by Arrinal Sholifadliq on 13/07/22.
//

import XCTest
@testable import Fake_Store

class Fake_StoreTests: XCTestCase {

    
    var presenter: StorePresenterProtocolInput = StorePresenter()
    var interactor: StoreInteractorProtocol = StoreInteractor()
    
    override func setUp() {
        super.setUp()
        
        presenter.interactor = interactor
        
    }
    
    func test() {
        
        interactor.productData = [ProductData(id: 1, title: "Backpack", price: 30, description: "Lorem Ipsum dolor", image: "", rating: "4"), ProductData(id: 2, title: "Tshirt", price: 20, description: "Sit amet", image: "", rating: "5")]
        interactor.isPaginating = false
        
        XCTAssertNotNil(presenter.getData)
        XCTAssertNotNil(presenter.getPaginatingStatus())
        XCTAssertEqual(presenter.getData()[0].title, "Backpack")
        XCTAssertEqual(presenter.getPaginatingStatus(), false)
    }
}
