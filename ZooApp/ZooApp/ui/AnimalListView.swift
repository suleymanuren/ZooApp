//
//  AnimalListView.swift
//  ZooApp
//
//  Created by Bulut Sistem on 3.07.2023.
//

import SwiftUI

struct AnimalListView: View {
    let animalsData : AnimalsModel
    
    var body: some View {
            HStack(alignment: .center, spacing: 16){
                Image(animalsData.image ?? "")
                    .resizable()
                    .scaledToFit()
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
                VStack(alignment: .leading, spacing: 8) {
                    Text(animalsData.name ?? "")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                    Text(animalsData.headline ?? "")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.trailing, 8)
                }
            }
        }
    }

struct AnimalListView_Previews: PreviewProvider {
    static let animals : [AnimalsModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        
        AnimalListView(animalsData: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
