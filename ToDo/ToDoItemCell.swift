//
//  ToDoItemCell.swift
//  ToDo
//
//  Created by Vasanth Kumar on 19/05/23.
//

import UIKit

class ToDoItemCell: UITableViewCell {
    
    var titleLabel: UILabel
    var dateLabel: UILabel
    var locationLabel: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel()
        dateLabel = UILabel()
        locationLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(locationLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
