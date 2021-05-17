//
//  AdView.swift
//  debug
//
//  Created by Mitchell Drew on 16/5/21.
//

import Foundation
import UIKit
import GoogleMobileAds

class AdViewController: UIViewController {
    internal let adUnitId:String
    internal let bannerView: GADBannerView
    
    init(adUnitId:String){
        self.adUnitId = adUnitId
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupBannerView() {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.adUnitID = adUnitId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
}
