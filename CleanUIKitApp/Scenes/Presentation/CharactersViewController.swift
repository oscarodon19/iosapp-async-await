//
//  ViewController.swift
//  CleanUIKitApp
//
//  Created by Dev on 02/02/2022.
//

import UIKit
import Combine

class CharactersViewController: UIViewController {
    
    private var viewModel: CharactersViewModel
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(viewModel: CharactersViewModel = CharactersViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        Task {
            await viewModel.viewDidLoad()
            tableView.reloadData()
        }
    }
    
    func setupView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "R & M Characters"
    }
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var contentConfiguration = cell.defaultContentConfiguration()
        let character = viewModel.characters[indexPath.item]
        
        contentConfiguration.text = character.name
        contentConfiguration.secondaryText = "Species: \(character.species)"
        contentConfiguration.imageProperties.maximumSize = CGSize(width: 50, height: 50)
        cell.contentConfiguration = contentConfiguration
                
        return cell
    }
}
