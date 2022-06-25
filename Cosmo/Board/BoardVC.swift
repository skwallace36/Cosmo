//
//  CardBoardVC.swift
//  Cosmo
//
//  Created by Stuart Wallace on 6/24/22.
//

import UIKit

class BoardVC: UIViewController {

    public var viewModel: BoardVM? {
        didSet {
            groupVCs = viewModel?.groups.map { GroupVC($0) }
            applyViewModel()
        }
    }
    var groupVCs: [GroupVC]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.91, green: 0.85, blue: 0.65, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false

        guard let _ = viewModel else { return }
        applyViewModel()
    }
    func applyViewModel() {
        guard let viewModel = viewModel else { return }
        guard let groupVCs = groupVCs else { return }

        groupVCs.forEach {
            addChild($0)
            view.addSubview($0.view)
            $0.view.translatesAutoresizingMaskIntoConstraints = false
        }
        for (index, group) in groupVCs.enumerated() {

            NSLayoutConstraint.activate([
                group.view.topAnchor.constraint(equalTo: view.topAnchor, constant: viewModel.padding),
                group.view.leftAnchor.constraint(equalTo: index == 0 ? view.leftAnchor : groupVCs[index - 1].view.rightAnchor, constant: viewModel.padding),
                group.view.rightAnchor.constraint(equalTo: index == groupVCs.count - 1 ? view.rightAnchor : groupVCs[index + 1].view.leftAnchor, constant: -viewModel.padding),
                group.view.widthAnchor.constraint(equalToConstant: viewModel.width),
                group.view.heightAnchor.constraint(equalToConstant: viewModel.height)
            ])
        }

    }

}

enum BoardLayout {
    case Columns
}

class BoardVM {
    let layout = BoardLayout.Columns
    let groups = [Group(), Group(), Group(), Group(), Group(), Group()]


    // LINEAR COLUMNS
    let width = 240.0
    let height = 480.0
    let padding = 16.0
}
