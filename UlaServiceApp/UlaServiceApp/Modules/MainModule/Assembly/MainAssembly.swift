//
//  MainAssembly.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 30.03.2024.
//


import Foundation
import UIKit

final class MainAssembly {
    static func assembly(moduleOutput: MainModuleOutput? = nil) -> UIViewController {
        let presenter = MainPresenter()
        let viewController = MainViewController(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = moduleOutput

        return viewController
    }
}
