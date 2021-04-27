//
//  HomeItemContentConfiguration.swift
//  debug
//
//  Created by Mitchell Drew on 27/4/21.
//

import Foundation
import UIKit

struct HomeItemGridContentConfiguration: UIContentConfiguration, Hashable {
    var name:String?
    var image:UIImage?

    func makeContentView() -> UIView & UIContentView {
        return HomeItemGridContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> HomeItemGridContentConfiguration {
        // Perform update on parameters that does not related to cell's data itesm
            
            // Make sure we are dealing with instance of UICellConfigurationState
            guard let state = state as? UICellConfigurationState else {
                return self
            }
            
            // Updater self based on the current state
            var updatedConfiguration = self

            return updatedConfiguration
    }
}
