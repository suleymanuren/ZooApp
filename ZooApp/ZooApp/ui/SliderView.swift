//
//  SliderView.swift
//  ZooApp
//
//  Created by Bulut Sistem on 3.07.2023.
//

import SwiftUI

struct SliderView: View {
    let sliderImages : [SliderModel] = Bundle.main.decode("covers.json")
    

    var body: some View {
        TabView{
            ForEach(sliderImages) {animal in
                Image(animal.name ?? "")
                    .resizable()
                    .scaledToFill()
                    
            }
        }.tabViewStyle(PageTabViewStyle())
        
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
