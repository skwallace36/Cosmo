//
//  ViewController.swift
//  Cosmo
//
//  Created by Stuart Wallace on 6/22/22.
//

import UIKit

class RootVC: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .random()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .random()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.showsVerticalScrollIndicator = true


        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollFrameGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollFrameGuide.bottomAnchor),


        ])

        let boardVC = BoardVC()
        addChild(boardVC)
        boardVC.view.translatesAutoresizingMaskIntoConstraints = false
        let boardViewModel = BoardVM()
        boardVC.viewModel = boardViewModel
        contentView.addSubview(boardVC.view)
        NSLayoutConstraint.activate([contentView.widthAnchor.constraint(equalTo: boardVC.view.widthAnchor)])

    }

}
