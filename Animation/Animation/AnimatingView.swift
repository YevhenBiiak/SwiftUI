//
//  AnimatedView.swift
//  Animation
//
//  Created by Yevhen Biiak on 03.01.2023.
//

import SwiftUI

struct AnimatedView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let side = min(geometry.size.width, geometry.size.height)
                let frame = CGSize(width: side, height: side)
                
                MovingRectangle(position: .middle, in: frame)
                MovingRectangle(position: .middleBottom, in: frame)
                MovingRectangle(position: .leftBottom, in: frame)
                MovingRectangle(position: .leftMiddle, in: frame)
                MovingRectangle(position: .leftTop, in: frame)
                MovingRectangle(position: .middleTop, in: frame)
                MovingRectangle(position: .rightTop, in: frame)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .rotationEffect(.degrees(45))
            .scaleEffect(0.72)
        }
    }
}

struct LoadingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedView()
    }
}
