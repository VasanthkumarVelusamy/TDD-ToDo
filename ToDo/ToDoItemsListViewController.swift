//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by Vasanth Kumar on 18/05/23.
//

import UIKit
import Combine

protocol ToDoItemsListViewControllerProtocol {
    func selectToDoItem(_ viewController: UIViewController, item: ToDoItem)
}

enum Section {
    case todo
    case done
}

class ToDoItemsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var toDoItemStore: ToDoItemStoreProtocol?
    private var items: [ToDoItem] = []
    private var token: AnyCancellable?
    let dateFormatter = DateFormatter()
    private var dataSource: UITableViewDiffableDataSource<Section, ToDoItem>?
    var delegate: ToDoItemsListViewControllerProtocol?
    
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
        tableView.delegate = self
    }
    
    private func update(with items: [ToDoItem]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ToDoItem>()
        snapshot.appendSections([.todo, .done])
        snapshot.appendItems((items.filter { false == $0.done }), toSection: .todo)
        snapshot.appendItems((items.filter { $0.done }), toSection: .done)
        dataSource?.apply(snapshot)
    }
}

extension ToDoItemsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        delegate?.selectToDoItem(self, item: item)
    }
}
