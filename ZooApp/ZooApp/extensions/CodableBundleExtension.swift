//
//  CodableBundleExtension.swift
//  ZooApp
//
//  Created by Bulut Sistem on 3.07.2023.
//

import Foundation

extension Bundle {
    func decode<T: Codable> (_ file: String) -> T {
        //locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        //create a property for the data
        guard let data = try? Data(contentsOf: url) else {
          fatalError("Failed to load \(file) from bundle")
        }
        
        // create a decoder
        let decoder = JSONDecoder()
        
        // crate a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle ")
        }
        
        // return to ready to use data
        return loaded
    }
  
}
