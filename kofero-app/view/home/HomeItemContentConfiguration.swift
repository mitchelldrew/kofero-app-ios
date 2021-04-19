//
//  HomeItemListContentConfiguration.swift
//  debug
//
//  Created by Mitchell Drew on 19/4/21.
//

import Foundation
import UIKit
import presenter

struct HomeItemContentConfiguration: UIContentConfiguration, Equatable {
    
    var name:String?
    var image:UIImage?
    var isFav:Bool?
    var switchClosure: ((String, Bool) -> Void)?
    
    func makeContentView() -> UIView & UIContentView {
        return RestaurantItemContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> HomeItemContentConfiguration {
        guard state is UICellConfigurationState else {
                return self
            }
            let updatedConfiguration = self
            return updatedConfiguration
    }
    
    
    static func == (lhs: HomeItemContentConfiguration, rhs: HomeItemContentConfiguration) -> Bool {
        return lhs.name == rhs.name
    }
}
