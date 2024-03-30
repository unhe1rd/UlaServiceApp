//
//  ViewController.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 30.03.2024.
//

import UIKit

class MainViewController: UIViewController{
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

private extension MainViewController {
    func setupUI(){
        view.backgroundColor = .red
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainServiceCell.self, forCellWithReuseIdentifier: "MainServiceCell")
//            collectionView.register(MainServiceCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainServiceCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
            
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mainCellModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainServiceCell", for: indexPath) as! MainServiceCell
        cell.configure(with: mainCellModel[indexPath.row])
        return cell
    }
    
}


//Setup View by Presenter
extension MainViewController: MainViewInput {
    
    func configure(with model: MainViewModel) {
        self.mainCellModel = model.services
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

