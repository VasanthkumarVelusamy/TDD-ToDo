//
//  FileManagerExtension.swift
//  ToDo
//
//  Created by Vasanth Kumar on 18/05/23.
//

import Foundation

extension FileManager {
    func documentsURL(name: String) -> URL {
        guard let documentsURL = urls(for: .documentDirectory,
                                      in: .userDomainMask).first
        else {
            fatalError()
        }
        
        return documentsURL.appendingPathComponent(name)
    }
}
