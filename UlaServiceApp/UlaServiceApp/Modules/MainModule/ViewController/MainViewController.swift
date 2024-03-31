//
//  MainViewControllerWithTableView.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 31.03.2024.
//


import UIKit

class MainViewController: UIViewController{
    //ViewController Properties
    private let output: MainViewOutput
    private var mainModel: MainViewModel?
    private var mainCellModel: [ServicesModel] = []
    private let tableView = UITableView()
    
    
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
        setupTableView()
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 16
        tableView.register(TableCell.self, forCellReuseIdentifier: "TableCell")
        tableView.showsVerticalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainCellModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        cell.accessoryType = .disclosureIndicator
        cell.configure(with: mainCellModel[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableHeader()
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath) != nil {
            output.didTapOnCell(mainCellModel[indexPath.row].link)
        }
        
        if let selectedIndexPath = tableView.indexPathsForSelectedRows?.first {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
}


//Setup View by Presenter
extension MainViewController: MainViewInput {
    
    func configure(with model: MainViewModel) {
        self.mainCellModel = model.services
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
}
