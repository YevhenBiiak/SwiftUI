//
//  ContentView.swift
//  Animation
//
//  Created by Yevhen Biiak on 03.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAnimatedView = false

    var body: some View {
        VStack {
            Spacer().frame(maxHeight: 250)
            
            if showAnimatedView {
                AnimatedView()
                    .frame(width: 200, height: 200)
                    .scaleEffect(showAnimatedView ? 1 : 0)
                    .opacity(showAnimatedView ? 1 : 0)
                    .transition(
                        .asymmetric(
                            insertion: .scale.combined(with: .push(from: .leading)),
                            removal: .move(edge: .top).combined(with: .opacity)
                        )
                    )
            }
            
            Spacer()
            
            Button(showAnimatedView ? "Hide animation" : "Show animation") {
                withAnimation {
                    showAnimatedView.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

