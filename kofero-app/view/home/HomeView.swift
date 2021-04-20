//
//  HomeView.swift
//  debug
//
//  Created by Mitchell Drew on 10/3/21.
//

import Foundation
import presenter
import UIKit
import GoogleMobileAds

class HomeView: UIViewController, IHomeView, UICollectionViewDelegate{
    private let presenter:IHomePresenter
    private let gameViewBuilder: GameViewBuilder
    
    private var collectionView:UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item<ModelObj>>!
    private var snapshot: NSDiffableDataSourceSnapshot<Section, Item<ModelObj>>!
    private var bannerView: GADBannerView?
    
    
    enum Section{
        case main
    }
    
    init(homePresenter:IHomePresenter, gameViewBuilder:GameViewBuilder) {
        self.presenter = homePresenter
        self.gameViewBuilder = gameViewBuilder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        presenter.setView(view_: self)
        buildCollectionView()
        presenter.showGames()
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)

        addBannerViewToView(bannerView!)
    }
    
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                      attribute: .bottom,
                                      relatedBy: .equal,
                                      toItem: view.safeAreaLayoutGuide,
                                      attribute: .top,
                                      multiplier: 1,
                                      constant: 0),
                   NSLayoutConstraint(item: bannerView,
                                      attribute: .centerX,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .centerX,
                                      multiplier: 1,
                                      constant: 0)
            ])
    }
    
    func buildCollectionView(){
        var layoutConfig = UICollectionLayoutListConfiguration(appearance: .plain)
        layoutConfig.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
        ])
        let cellRegistration = UICollectionView.CellRegistration<HomeItemListCell, Item<ModelObj>> { [self] (cell, indexPath, item) in
            cell.item = item
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item<ModelObj>>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Item<ModelObj>) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                                    for: indexPath,
                                                                    item: identifier)
            
            cell.accessories = [.disclosureIndicator()]
            
            return cell
        }
        collectionView.alpha = 100
    }
    
    func display(url: String, imgBase64: String) {
        
    }
    
    func display(games: [ModelGame]) {
        print(games)
        snapshot = NSDiffableDataSourceSnapshot<Section, Item<ModelObj>>()
        snapshot.appendSections([.main])
    }
    
    func error(error: KotlinException) {
        print(error)
    }
}
