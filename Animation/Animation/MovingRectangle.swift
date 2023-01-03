//
//  MovingRectangle.swift
//  Animation
//
//  Created by Yevhen Biiak on 03.01.2023.
//

import SwiftUI

struct MovingRectangle: View {
    
    enum Position: CaseIterable {
        case middle, middleBottom, leftBottom, leftMiddle, leftTop, middleTop, rightTop, rightMiddle
    }
    
    init(position: Position, in frame: CGSize) {
        self.position = position
        self.frame = frame
        switch position {
            case .middle:       delay = 7
            case .middleBottom: delay = 6
            case .leftBottom:   delay = 5
            case .leftMiddle:   delay = 4
            case .leftTop:      delay = 3
            case .middleTop:    delay = 2
            case .rightTop:     delay = 1
            case .rightMiddle:  delay = 0
        }
    }
    
    @State private var position: Position
    private let frame: CGSize
    private let delay: Double
    private let duration: Double = 0.3
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: frame.width / 20)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2368077934, green: 0.8284824491, blue: 0.4088689089, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    )
                    .frame(width: frame.width / 3.2, height: frame.height / 3.2)
                    .offset(offset)
                    .animation(.easeOut(duration: duration).delay(delay * duration), value: position)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 7 * duration, repeats: true) { timer in
                            switch position {
                            case .middle:       position = .middleBottom
                            case .middleBottom: position = .leftBottom
                            case .leftBottom:   position = .leftMiddle
                            case .leftMiddle:   position = .leftTop
                            case .leftTop:      position = .middleTop
                            case .middleTop:    position = .rightTop
                            case .rightTop:     position = .rightMiddle
                            case .rightMiddle:  position = .middle
                            }
                        }.fire()
                }
        }
        .frame(width: frame.width, height: frame.height)
    }
    
    private var offset: CGSize {
        let offset = frame.width / 3
        
        switch position {
        case .middle:       return CGSize(width: 0, height: 0)
        case .middleBottom: return CGSize(width: 0, height: offset)
        case .leftBottom:   return CGSize(width: -offset, height: offset)
        case .leftMiddle:   return CGSize(width: -offset, height: 0)
        case .leftTop:      return CGSize(width: -offset, height: -offset)
        case .middleTop:    return CGSize(width: 0, height: -offset)
        case .rightTop:     return CGSize(width: offset, height: -offset)
        case .rightMiddle:  return CGSize(width: offset, height: 0)
        }
    }
    
}

struct AnimatedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        MovingRectangle(position: .middle, in: CGSize(width: 200, height: 200))
    }
}
