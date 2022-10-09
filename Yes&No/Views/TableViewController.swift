//
//  TableViewController.swift
//  Yes&No
//
//  Created by Артур Фомин on 02.09.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    var viewModel =  TableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        tableView.register(TableViewCell.self, forCellReuseIdentifier: K.tableViewCell)
        tableView.rowHeight = 140
        
    }

//     MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.storyImages[0].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tableViewCell, for: indexPath) as? TableViewCell
        guard let cell = cell else {return UITableViewCell()}
        
        viewModel.setup(indexPath: indexPath)
        
        viewModel.stories.bind { models in
            DispatchQueue.main.async {
                cell.cellImageView.image = models[indexPath.row].image
                cell.nameLabel.text = models[indexPath.row].title
            }
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let detailVC = DetailViewController()
        detailVC.viewModel.categoryIndex = viewModel.currentIndex
        detailVC.viewModel.storyIndex = indexPath.row
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
