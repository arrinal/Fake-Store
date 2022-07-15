//
//  ProductCollectionViewCell.swift
//  Fake Store
//
//  Created by Arrinal Sholifadliq on 13/07/22.
//

import UIKit

class ProductCollectionViewCell: UITableViewCell {
    
    static let identifier = "productCell"
    
    let productTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var productPrice: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let productDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let imageBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let productRating: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let horizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 10
        stackView.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        stackView.layer.shadowOpacity = 0.5
        stackView.layer.shadowOffset = CGSize(width: 5, height: 5)
        stackView.layer.shadowRadius = 5
        stackView.layer.shouldRasterize = true
        stackView.layer.rasterizationScale = UIScreen.main.scale
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        verticalStack.addSubview(productTitle)
        verticalStack.addSubview(productDescription)
        verticalStack.addSubview(productRating)
        
        horizontalStack.addSubview(imageBackground)
        horizontalStack.addSubview(productImage)
        horizontalStack.addSubview(productPrice)
        horizontalStack.addSubview(verticalStack)
        contentView.addSubview(horizontalStack)
        
        horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        imageBackground.widthAnchor.constraint(equalToConstant: contentView.frame.width * 1/3 + 50).isActive = true
        imageBackground.topAnchor.constraint(equalTo: horizontalStack.topAnchor).isActive = true
        imageBackground.leadingAnchor.constraint(equalTo: horizontalStack.leadingAnchor).isActive = true
        imageBackground.bottomAnchor.constraint(equalTo: horizontalStack.bottomAnchor).isActive = true

        productImage.centerYAnchor.constraint(equalTo: horizontalStack.centerYAnchor).isActive = true
        productImage.topAnchor.constraint(equalTo: horizontalStack.topAnchor, constant: 10).isActive = true
        productImage.leadingAnchor.constraint(equalTo: horizontalStack.leadingAnchor, constant: 10).isActive = true
        productImage.trailingAnchor.constraint(equalTo: verticalStack.leadingAnchor, constant: -10).isActive = true
        productImage.bottomAnchor.constraint(equalTo: horizontalStack.bottomAnchor, constant: -10).isActive = true

        productPrice.topAnchor.constraint(equalTo: horizontalStack.topAnchor, constant: 10).isActive = true
        productPrice.leadingAnchor.constraint(equalTo: horizontalStack.leadingAnchor, constant: 10).isActive = true

        verticalStack.centerYAnchor.constraint(equalTo: horizontalStack.centerYAnchor).isActive = true
        verticalStack.topAnchor.constraint(equalTo: horizontalStack.topAnchor, constant: 10).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: imageBackground.trailingAnchor).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: horizontalStack.trailingAnchor, constant: -15).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: horizontalStack.bottomAnchor, constant: -10).isActive = true

        productTitle.topAnchor.constraint(equalTo: verticalStack.topAnchor).isActive = true
        productTitle.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor, constant: 10).isActive = true
        productTitle.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor).isActive = true
        productTitle.bottomAnchor.constraint(equalTo: productDescription.topAnchor, constant: -10).isActive = true

        productDescription.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 10).isActive = true
        productDescription.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor, constant: 10).isActive = true
        productDescription.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor).isActive = true
        productDescription.bottomAnchor.constraint(equalTo: horizontalStack.bottomAnchor, constant: -50).isActive = true

        productRating.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor).isActive = true
        productRating.bottomAnchor.constraint(equalTo: verticalStack.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundCorners(view: imageBackground, corners: [.topLeft, .bottomLeft], radius: 10)
    }
    
    public func configure(title: String, price: Int, description: String, image: String, rating: String) {
        
        
        productImage.image = UIImage(named: "placeholderImage")
        productImage.load(url: URL(string: image)!, backgroundView: imageBackground)
        productTitle.text = title
        productPrice.text = "$ \(price)"
        productDescription.text = description
        productRating.text = "★ \(rating)"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
