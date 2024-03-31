//
//  MainPresenter.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 30.03.2024.
//

import Foundation
import UIKit
import Kingfisher

final class MainPresenter {
    
    weak var view: MainViewInput?
    weak var moduleOutput: MainModuleOutput?
}

extension MainPresenter: MainModuleInput {}

extension MainPresenter: MainViewOutput {
    func didTapOnCell(_ url: String) {
        if let url = URL(string: "https://my.games/") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                if let webURL = URL(string: "https://my.games/") {
                    UIApplication.shared.open(webURL)
                }
            }
        }
    }
    
    func didLoadView() {
        loadData()
    }
}


private extension MainPresenter {
    
    func loadData() {
        let networkManager = MainNetworkManager.shared
        networkManager.fetchData { [weak self] result in
            DispatchQueue.global().async {
                switch result {
                case .success(let services):
                    self?.updateUI(with: services)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func updateUI(with services: MainNetworkResponse) {
    
        let servicesModel = services.body.services.map { servise in
            return ServicesModel (
                image: servise.icon_url,
                title: servise.name,
                description: servise.description,
                link: servise.link)
        }
        
        let mainModel:MainViewModel = .init(services: servicesModel)
        view?.configure(with: mainModel)
    }
}
