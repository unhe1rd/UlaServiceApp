//
//  ViewController.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 30.03.2024.
//

import UIKit

class WeatherViewController: UIViewController{
    //ViewController Properties
    private let output: MainViewOutput
    private var mainModel: MainViewModel?
    private var mainCellModel: [ServicesModel] = []
    
    private let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    
    init(output: MainViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        output.didLoadView()
    }
}

private extension WeatherViewController {
    func setupUI(){
        view.backgroundColor = .red
        
        setupCollection()
    }
    
    func setupCollection(){
        
    }
}


//Setup View by Presenter
extension WeatherViewController: MainViewInput {
    
    func configure(with model: MainViewModel) {
        self.mainCellModel = model.services
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

