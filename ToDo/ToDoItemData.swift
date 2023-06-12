//
//  ToDoItemData.swift
//  ToDo
//
//  Created by Vasanth Kumar on 31/05/23.
//

import Foundation

class ToDoItemData: ObservableObject {
    @Published var title: String = ""
    @Published var date = Date()
}
