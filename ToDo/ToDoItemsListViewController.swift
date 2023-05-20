//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by Vasanth Kumar on 18/05/23.
//

import UIKit
import Combine

class ToDoItemsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var toDoItemStore: ToDoItemStoreProtocol?
    private var items: [ToDoItem] = []
    private var token: AnyCancellable?
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(ToDoItemCell.self, forCellReuseIdentifier: "ToDoItemCell")
        token = toDoItemStore?.itemPublisher.sink(receiveValue: { items in
            self.items = items
        })
        dateFormatter.dateFormat = "yyyy/MM/dd"
    }
}

extension ToDoItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ToDoItemCell
        let item = items[indexPath.row]
        cell.titleLabel.text = item.title
        if let timeStamp = item.timeStamp {
            let date = Date(timeIntervalSince1970: timeStamp)
            cell.dateLabel.text = dateFormatter.string(from: date)
        }
        return cell
    }
}
