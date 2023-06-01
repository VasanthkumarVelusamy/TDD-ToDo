//
//  ToDoItemInputView.swift
//  ToDo
//
//  Created by Vasanth Kumar on 31/05/23.
//

import SwiftUI

struct ToDoItemInputView: View {
    @ObservedObject var data: ToDoItemData
    @State var dummy = ""
    var body: some View {
        TextField("Title", text: $dummy)
    }
}

struct ToDoItemInputView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemInputView(data: ToDoItemData())
    }
}
