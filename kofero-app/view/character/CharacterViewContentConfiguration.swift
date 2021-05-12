//
//  CharacterViewContentConfiguration.swift
//  debug
//
//  Created by Mitchell Drew on 11/5/21.
//

import Foundation
import UIKit


struct CharacterViewContentConfiguration: UIContentConfiguration, Hashable {
    var name: String?
    var symbol: UIImage?
    var startup: String?
    var active: String?
    var recovery: String?
    var hitAdv: String?
    var blockAdv: String?
    var notes: String?
    
    // We will work on the implementation in a short while.
}

class CharacterViewContentView: UIView, UIContentView {
    
    // We will work on the implementation in a short while.
    
    init(configuration: CharacterViewContentConfiguration) {
       // Custom initializer implementation here.
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
