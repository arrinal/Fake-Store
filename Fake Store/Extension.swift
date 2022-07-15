//
//  Extension.swift
//  Fake Store
//
//  Created by Arrinal Sholifadliq on 13/07/22.
//

import UIKit

extension UIImageView {
    func load(url: URL, backgroundView: UIView) {
            backgroundView.backgroundColor = .gray
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
            DispatchQueue.main.async {
                backgroundView.backgroundColor = .white
            }
        }
    }
}

extension UIView {
    func roundCorners(view :UIView, corners: UIRectCorner, radius: CGFloat){
            let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            view.layer.mask = mask
    }
}
