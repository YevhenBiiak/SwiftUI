//
//  UIApplication + .swift
//  RGB Slider
//
//  Created by Yevhen Biiak on 27.12.2022.
//

import UIKit

extension UIApplication {
    
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
