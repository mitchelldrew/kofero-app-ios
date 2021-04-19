//
//  HomeItemContentView.swift
//  debug
//
//  Created by Mitchell Drew on 19/4/21.
//

import Foundation
import UIKit

class RestaurantItemContentView: UIView, UIContentView {
    let imageview = UIImageView()
    let nameLabel = UILabel()
    let favoriteSwitch = UISwitch()
    
    private var currentConfiguration: HomeItemContentConfiguration!
        var configuration: UIContentConfiguration {
            get {
                currentConfiguration
            }
            set {
                guard let newConfiguration = newValue as? HomeItemContentConfiguration else {
                    return
                }
                apply(configuration: newConfiguration)
            }
        }
    
    init(configuration: HomeItemContentConfiguration) {
        super.init(frame: .zero)
        setup()
        apply(configuration: configuration)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
    }
    
    private func apply(configuration: HomeItemContentConfiguration) {
        guard currentConfiguration != configuration else {
            return
        }
        
        currentConfiguration = configuration
        
        
        favoriteSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
    }
    
    
    @objc func switchChanged(mySwitch: UISwitch) {
        let value = mySwitch.isOn
        if let uName = currentConfiguration.name {
            if let uClosure = currentConfiguration.switchClosure {
                uClosure(uName,value)
            }
        }
    }
}
