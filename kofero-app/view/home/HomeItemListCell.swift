//
//  HomeItemListCell.swift
//  debug
//
//  Created by Mitchell Drew on 19/4/21.
//

import Foundation
import UIKit
import presenter

class HomeItemListCell: UICollectionViewListCell {
    var item: Item<ModelObj>?
    var isFavorite:Bool = false
    var switchClosure: ((String, Bool) -> Void)?
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var newConfiguration = HomeItemContentConfiguration().updated(for: state)
            
        newConfiguration.image = item?.image
        newConfiguration.isFav = isFavorite
        newConfiguration.switchClosure = switchClosure
        
        contentConfiguration = newConfiguration
        }
}

