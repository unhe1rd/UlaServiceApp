//
//  ServiceCell.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 30.03.2024.
//

import UIKit
import Kingfisher

final class MainServiceCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
    private let appImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ServicesModel) {
        if let url = URL(string: model.image) {
            appImage.kf.setImage(with: url)
        } else {
            print("Неверный URL изображения")
        }
    }
}

private extension MainServiceCell {
    func setupCell() {
        
        setupAppImage()
    }
    
    func setupAppImage() {
        addSubview(appImage)
        appImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            appImage.widthAnchor.constraint(equalToConstant: 100),
            appImage.heightAnchor.constraint(equalToConstant: 100),
            appImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            appImage.topAnchor.constraint(equalTo: topAnchor, constant: 12)
        ])
    }
}
