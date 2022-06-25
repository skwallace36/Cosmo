//
//  GroupViewController.swift
//  Cosmo
//
//  Created by Stuart Wallace on 6/24/22.
//

import UIKit



struct Item {

}

struct Group {
    let items = [Item(), Item(), Item()]
}

struct GroupViewModel {
    let title: String
}


class GroupVC: UIViewController {

    let colorOne = UIColor(red: 0.61, green: 0.13, blue: 0.15, alpha: 1.00)
    let titleLabel = UILabel()

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    init(_ group: Group) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor(red: 0.58, green: 0.82, blue: 0.74, alpha: 1.00)
        view.layer.borderColor = UIColor(red: 0.58, green: 0.82, blue: 0.74, alpha: 1.00).cgColor
        view.layer.cornerRadius = 8.0


        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 8.0),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0)
        ])
    }

    func apply(_ viewModel: GroupViewModel) {
        titleLabel.text = title
        titleLabel.sizeToFit()
    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        print(view.frame.size.width)
//    }
    
}
