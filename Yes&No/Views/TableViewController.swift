//
//  TableViewController.swift
//  Yes&No
//
//  Created by Артур Фомин on 02.09.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    var viewModel: TableViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        tableView.register(TableViewCell.self, forCellReuseIdentifier: K.tableViewCell)
        tableView.rowHeight = 140
        
    }

    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return viewModel?.numberOfRows() ?? 0
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: K.tableViewCell, for: indexPath) as? TableViewCell
//        guard let cell = cell, let viewModel = viewModel else {return UITableViewCell()}
//        cell.viewModel = viewModel.cellViewModel(for: indexPath)
//
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let viewModel = viewModel else {return}
//        viewModel.selectRow(at: indexPath)
//        let detailVC = DetailViewController()
//        detailVC.viewModel = viewModel.viewModelForSelectedRow()
//        navigationController?.pushViewController(detailVC, animated: true)
//    }

}
