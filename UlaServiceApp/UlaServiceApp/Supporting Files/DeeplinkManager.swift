//
//  DeeplinkManager.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 31.03.2024.
//

import UIKit

final class DeeplinkManager {
    
    static let shared = DeeplinkManager()
    private init() {}
    
    func open(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            openFallbackURL(urlString: urlString)
        }
    }
    
    private func openFallbackURL(urlString: String) {
        guard let webURL = URL(string: urlString) else { return }
        UIApplication.shared.open(webURL)
    }
}
