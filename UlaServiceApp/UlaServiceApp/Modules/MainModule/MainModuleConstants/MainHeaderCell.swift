//
//  MainHeaderCell.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 31.03.2024.
//

import UIKit

final class MainHeaderView: UICollectionReusableView {
    
    var headerLabel = UILabel()
    static let identifier = "MainViewHeader"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainHeaderView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupMainHeaderView()
    }
    
    public func setupMainHeaderView() {
        backgroundColor = .white
        setupHeaderLabel()
    }
    
    
    func setupHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Сервисы"
        headerLabel.font = .systemFont(ofSize: 24)
        headerLabel.textAlignment = .center
        headerLabel.textColor = Constants.textColor
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leftAnchor.constraint(equalTo: leftAnchor),
            headerLabel.rightAnchor.constraint(equalTo: rightAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
