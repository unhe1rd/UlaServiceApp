//
//  ViewController.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 30.03.2024.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        let network = MainNetworkManager.shared
        network.fetchData { result in
            switch result {
            case .success(let services):
                print(services)
            case .failure(let error):
                print(error)
            }
            
        }
    }


}

