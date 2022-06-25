//
//  Extensions.swift
//  Cosmo
//
//  Created by Stuart Wallace on 6/24/22.
//

import UIKit

extension UIView {
    func pin(to view: UIView, safeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: safeArea ? view.safeAreaLayoutGuide.leftAnchor : view.leftAnchor),
            self.rightAnchor.constraint(equalTo: safeArea ? view.safeAreaLayoutGuide.rightAnchor : view.rightAnchor),
            self.topAnchor.constraint(equalTo: safeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor),
            self.bottomAnchor.constraint(equalTo: safeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor)
        ])
    }

}


extension UIColor {
    static func random() -> UIColor {
        UIColor(red: CGFloat(arc4random_uniform(255))/255.0,
                green: CGFloat(arc4random_uniform(255))/255.0,
                blue: CGFloat(arc4random_uniform(255))/255.0,
                alpha: 1.0)
    }
}
