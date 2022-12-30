//
//  SliderUIKit.swift
//  Hosting UIView In SwiftUI
//
//  Created by Yevhen Biiak on 29.12.2022.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {
    
    @Binding var value: Double
    let alpha: Double
    let range: ClosedRange<Int>
    let tintColor: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = Float(range.lowerBound)
        slider.maximumValue = Float(range.upperBound)
        slider.thumbTintColor = tintColor
        slider.minimumTrackTintColor = tintColor
        slider.maximumTrackTintColor = tintColor
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ slider: UISlider, context: Context) {
        slider.value = Float(value)
        slider.alpha = alpha
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderUIKit {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }

        @objc func valueChanged(_ slider: UISlider) {
            value = Double(slider.value)
        }
    }
}

struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(value: .constant(0), alpha: 0.5, range: 0...50, tintColor: .black)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
