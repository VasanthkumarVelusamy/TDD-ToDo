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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        token = toDoItemStore?.itemPublisher.sink(receiveValue: { items in
            self.items = items
        })
    }
}

extension ToDoItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
