//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by Vasanth Kumar on 18/05/23.
//

import UIKit
import Combine

enum Section {
    case main
}

class ToDoItemsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var toDoItemStore: ToDoItemStoreProtocol?
    private var items: [ToDoItem] = []
    private var token: AnyCancellable?
    let dateFormatter = DateFormatter()
    private var dataSource: UITableViewDiffableDataSource<Section, ToDoItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ToDoItemCell
            cell.titleLabel.text = item.title
            if let timeStamp = item.timeStamp {
                let date = Date(timeIntervalSince1970: timeStamp)
                cell.dateLabel.text = self?.dateFormatter.string(from: date)
            }
            return cell
        })
        tableView.register(ToDoItemCell.self, forCellReuseIdentifier: "ToDoItemCell")
        token = toDoItemStore?.itemPublisher.sink(receiveValue: { [weak self] items in
            self?.items = items
            self?.update(with: items)
        })
        dateFormatter.dateFormat = "yyyy/MM/dd"
    }
    private func update(with items: [ToDoItem]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ToDoItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        dataSource?.apply(snapshot)
    }
}
