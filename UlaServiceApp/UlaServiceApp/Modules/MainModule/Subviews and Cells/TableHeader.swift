//
//  TableHeader.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 31.03.2024.
//

import UIKit

final class TableHeader: UIView {
    
    var headerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainHeaderView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupMainHeaderView()
    }
    
    public func setupMainHeaderView() {
        setupHeaderLabel()
    }
    
    
    func setupHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Сервисы"
        headerLabel.font = .boldSystemFont(ofSize: 24)
        headerLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            headerLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

