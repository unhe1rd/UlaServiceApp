//
//  MainProtocols.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 30.03.2024.
//

import Foundation

protocol MainModuleInput {
    var moduleOutput: MainModuleOutput? { get }
}

protocol MainModuleOutput: AnyObject {
}

protocol MainViewInput: AnyObject {
    func configure(with model: MainViewModel)
}

protocol MainViewOutput: AnyObject {
    func didLoadView()
    func didTapOnCell(_ url: String)
}
