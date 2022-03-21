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
    var header: UIView!
    
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
    
    func addHeader(_ headerText:String){
        header = UIView()
        let label = UILabel()
        label.text = headerText
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        header.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(label)
        view.addSubview(header)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            label.topAnchor.constraint(equalTo: header.topAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
