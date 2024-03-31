//
//  TableCell.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 31.03.2024.
//

import UIKit
import Kingfisher

final class TableCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let appImage = UIImageView()
    private let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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

private extension TableCell {
    func setupCell() {
        
        setupAppImage()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    func setupAppImage() {
        addSubview(appImage)
        appImage.translatesAutoresizingMaskIntoConstraints = false
        
        let imageSize:CGFloat = 70
        NSLayoutConstraint.activate([
            appImage.widthAnchor.constraint(equalToConstant: imageSize),
            appImage.heightAnchor.constraint(equalToConstant: imageSize),
            appImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            appImage.centerYAnchor.constraint(equalTo: centerYAnchor)
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
            titleLabel.topAnchor.constraint(equalTo: appImage.topAnchor)
        ])
    }
    
    func setupDescriptionLabel(){
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = Constants.textColor
        descriptionLabel.font = .systemFont(ofSize: 12)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: appImage.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
    }
}
