//
//  AnimalsModel.swift
//  ZooApp
//
//  Created by Bulut Sistem on 3.07.2023.
//

import Foundation

struct AnimalsModel: Codable,Identifiable {

  var id   : String?    = nil
  var name : String? = nil
  var headline : String? = nil
  var description : String? = nil
  var link : String? = nil
  var image : String? = nil
  var gallery : [String]? = nil
  var fact : [String]? = nil


}
