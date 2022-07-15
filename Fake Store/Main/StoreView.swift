//
//  MainView.swift
//  Fake Store
//
//  Created by Arrinal Sholifadliq on 13/07/22.
//

import UIKit

class StoreView: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    var presenter: StorePresenterProtocolInput!
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(ProductCollectionViewCell.self, forCellReuseIdentifier: ProductCollectionViewCell.identifier)
        table.rowHeight = 200
        table.allowsSelection = false
        table.separatorStyle = .none
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        presenter.fetchProduct(pagination: false) {
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getData().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCell(withIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        let data = presenter.getData()

        item.configure(title: data[indexPath.row].title, price: data[indexPath.row].price, description: data[indexPath.row].description, image: data[indexPath.row].image, rating: data[indexPath.row].rating)

        return item
    }
    
    func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        
        return footerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        
        if position > 0 {
            
            guard !presenter.getPaginatingStatus() else { return }
            
            self.tableView.tableFooterView = createSpinnerFooter()
            
            presenter.fetchProduct(pagination: true) {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.tableView.tableFooterView = nil
                    }
            }
            
        }
    }
}

