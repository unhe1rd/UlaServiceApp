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
    private let descriptionLabel = UILabel()
    
    
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
        descriptionLabel.text = model.description
        titleLabel.text = model.title
    }
}

private extension MainServiceCell {
    func setupCell() {
        
        setupAppImage()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    func setupAppImage() {
        addSubview(appImage)
        appImage.translatesAutoresizingMaskIntoConstraints = false
        
        let imageSize:CGFloat = 50
        NSLayoutConstraint.activate([
            appImage.widthAnchor.constraint(equalToConstant: imageSize),
            appImage.heightAnchor.constraint(equalToConstant: imageSize),
            appImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            appImage.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    func setupTitleLabel(){
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Constants.textColor
        titleLabel.textAlignment = .left
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: appImage.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    func setupDescriptionLabel(){
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = Constants.textColor
        descriptionLabel.font = .systemFont(ofSize: 12)
        descriptionLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: appImage.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
    }
}
