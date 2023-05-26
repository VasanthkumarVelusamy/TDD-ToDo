//
//  ToDoItemDetailsViewController.swift
//  ToDo
//
//  Created by Vasanth Kumar on 26/05/23.
//

import UIKit
import MapKit

class ToDoItemDetailsViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var doneButton: UIButton!
    
    var toDoItem: ToDoItem? {
        didSet {
            titleLabel.text = toDoItem?.title
            dateLabel.text = toDoItem?.timeStamp?.getString(format: "yyyy/MM/dd")
        }
    }
    
}
