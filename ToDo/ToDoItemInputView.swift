//
//  ToDoItemInputView.swift
//  ToDo
//
//  Created by Vasanth Kumar on 31/05/23.
//

import SwiftUI

struct ToDoItemInputView: View {
    @ObservedObject var data: ToDoItemData
    @State var withDate = false
    var didAppear: ((Self) -> Void)?
    var body: some View {
        VStack {
            TextField("Title", text: $data.title)
            Toggle("Add Date", isOn: $withDate)
            DatePicker("Date", selection: $data.date)
        }
        .onAppear { self.didAppear?(self) }
    }
}

struct ToDoItemInputView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemInputView(data: ToDoItemData())
    }
}
