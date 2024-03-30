//
//  MainViewModel.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 30.03.2024.
//

import Foundation
import UIKit

struct MainViewModel {
    let services: [ServicesModel]
}

struct ServicesModel {
    
    let image: String
    let title: String
    let description: String
    let link: String
    
    init(image: String, title: String, description: String, link: String) {
        self.image = image
        self.title = title
        self.description = description
        self.link = link
    }
}
