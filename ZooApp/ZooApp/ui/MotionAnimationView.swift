//
//  MotionAnimationView.swift
//  ZooApp
//
//  Created by Bulut Sistem on 4.07.2023.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 12 ... 16)
    @State private var isAnimating = false
    // MARK: - FUNCTIOINS
    //RANDOM COORDINATE
    func randomCoordinate(max:CGFloat)-> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    //RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    //RANDOM SCALE
    func randomScale () -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    //RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    //RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    //RANDOM OPACITY
    func randomOpacity() -> Double {
        return Double.random(in: 0.05...0.7)
    }
    var body: some View {
        GeometryReader{geo in
            ZStack{
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(randomOpacity())
                        .frame(width: randomSize(),height: randomSize() ,alignment: .center)
                        .position(x:randomCoordinate(max: geo.size.width),
                                  y:randomCoordinate(max: geo.size.height))
                        .scaleEffect(isAnimating ? randomScale() :  1)
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay()))
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }
            }
                .drawingGroup()
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
