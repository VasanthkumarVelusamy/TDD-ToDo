//
//  Location.swift
//  ToDo
//
//  Created by Vasanth Kumar on 17/05/23.
//

import Foundation

struct Location: Equatable, Codable {
    let title: String
    let coordinate: Coordinate?
    
    init(title: String, coordinate: Coordinate? = nil) {
        self.title = title
        self.coordinate = coordinate
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        if lhs.title != rhs.title {
            return false
          }
        
          if lhs.coordinate == nil, rhs.coordinate != nil {
            return false
          }
        
          if lhs.coordinate != nil, rhs.coordinate == nil {

            return false

          }

          if let lhsCoordinate = lhs.coordinate,

              let rhsCoordinate = rhs.coordinate {

            if abs(lhsCoordinate.longitude -

              rhsCoordinate.longitude) > 0.000_000_1 {

              return false

            }

            if abs(lhsCoordinate.latitude -

              rhsCoordinate.latitude) > 0.000_000_1 {

              return false

            }

          }

          return true
    }
    
}
