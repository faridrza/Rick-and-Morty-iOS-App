//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 27.10.22.
//

import UIKit
import Alamofire
class CharactersMainMenuViewController: UIViewController {
    
    var myCell : NetworkingModel?
    var counter = 2
    
    
    //MARK: Views
    
    var searchBar = UISearchController(searchResultsController: SearchController())
    
    lazy var filterButton : UIBarButtonItem = {
        let view = UIBarButtonItem(image: AssetConstants().rightBarFilterButtonImage
                                   , style: .plain,
                                   target: self,
                                   action: #selector(rightBarButtonFilter))
        view.tintColor = .mainGreen
        return view
    }()
    
    lazy var myCollectionView : UICollectionView = {
        
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        var view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.id)
        view.frame = self.view.bounds
        view.refreshControl = UIRefreshControl()
        view.refreshControl?.addTarget(self, action: #selector(refreshFunc), for: .valueChanged)
        return view
    }()


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myCollectionView.backgroundColor = .customTeal
        self.view.backgroundColor = .customTeal
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        ///Setting up NavigationBar and SearchBar
        self.navigationItem.rightBarButtonItem = filterButton
        self.navigationItem.title = "Rick and Morty"
        

        

    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.searchController = searchBar
        searchBar.delegate = self
        searchBar.searchResultsUpdater = self
        
        DispatchQueue.main.async {
            self.getCharacterInfo()
        }
        

        myCollectionView.reloadData()
    }
    
    
    //MARK: Setting Up views
    override func loadView() {
        super.loadView()

        view.addSubview(myCollectionView)

        
        ///AutoLayout
        NSLayoutConstraint.activate([

        ])
        
    }
}




