//
//  HomeItemGridCell.swift
//  debug
//
//  Created by Mitchell Drew on 27/4/21.
//

import Foundation
import UIKit
import presenter

class HomeItemGridCell: UICollectionViewListCell {
    var item: Item<ModelObj>?

    override func updateConfiguration(using state: UICellConfigurationState) {
                
            // Create new configuration object and update it base on state
            var newConfiguration = HomeItemGridContentConfiguration().updated(for: state)
            
            // Update any configuration parameters related to data item
        
        newConfiguration.image = item?.image
        if let game = item?.item {
            if let uGame = game as? ModelGame {
                newConfiguration.name = uGame.name
            }
        }
        contentConfiguration = newConfiguration
    }
}
