//
//  AnimalsLocationModel.swift
//  ZooApp
//
//  Created by Bulut Sistem on 4.07.2023.
//

import Foundation
import CoreLocation


struct AnimalsLocationModel: Codable, Identifiable {

    var id: String? = nil
    var name: String? = nil
    var image: String? = nil
    var latitude: Double? = nil
    var longitude: Double? = nil

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longitude ?? 0)
    }
}

