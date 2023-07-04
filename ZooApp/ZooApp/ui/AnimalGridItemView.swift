//
//  AnimalGridItemView.swift
//  ZooApp
//
//  Created by Bulut Sistem on 4.07.2023.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    let animals : AnimalsModel
    var body: some View {
        Image(animals.image ?? "")
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals : [AnimalsModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animals: animals[1])
    }
}
