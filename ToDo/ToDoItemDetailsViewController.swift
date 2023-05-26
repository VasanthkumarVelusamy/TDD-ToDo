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
            guard let item = toDoItem else { return }
            titleLabel.text = item.title
            dateLabel.text = item.timeStamp?.getString(format: "yyyy/MM/dd")
            if let itemCoordinate = item.location?.coordinate {
                let coordinate = CLLocationCoordinate2D(latitude: itemCoordinate.latitude, longitude: itemCoordinate.longitude)
                mapView.setCenter(coordinate, animated: false)
            }
            doneButton.isEnabled = !item.done
        }
    }
    
}
