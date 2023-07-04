//
//  MapAnnotationView.swift
//  ZooApp
//
//  Created by Bulut Sistem on 4.07.2023.
//

import SwiftUI

struct MapAnnotationView : View {
    let location : AnimalsLocationModel
    @State private var animation : Double = 0.0

    var body: some View {
        ZStack{
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54,height: 54,alignment: .center)
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            Image(location.image ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: 48,height: 48,alignment: .center)
                .clipShape(Circle())
        }.onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}
