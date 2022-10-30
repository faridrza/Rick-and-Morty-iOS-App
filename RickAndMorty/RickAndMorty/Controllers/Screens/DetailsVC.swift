//
//  DetailsVC.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 30.10.22.
//

import UIKit

class DetailsVC: UIViewController {
    
    private let calculator = FontCalculate()
    
    //MARK: Views
    var name : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hemorrhage"
        return view
    }()
    
    var status : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Alive"
        return view
    }()
    
    var species : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Human"
        return view
    }()
    
    var gender : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Male"
        return view
    }()
    
    var avatar : UIImageView = {
        var view = UIImageView(image: UIImage(named: "Hemorrhage"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        return view
    }()
    

    var type : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Male"
        return view
    }()
    
    var origin : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Male"
        return view
    }()
    
    var tealView : UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .customTeal
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = .customTeal
        
        //Font resizing
        name.font = .systemFont(ofSize: calculator.overrideTitleFontSize(20))
        status.font = .systemFont(ofSize: calculator.overrideTitleFontSize(20))
        species.font = .systemFont(ofSize: calculator.overrideTitleFontSize(20))
        gender.font = .systemFont(ofSize: calculator.overrideTitleFontSize(20))
        type.font = .systemFont(ofSize: calculator.overrideTitleFontSize(20))
        origin.font = .systemFont(ofSize: calculator.overrideTitleFontSize(20))
        
        
        //Adding Subviews
        view.addSubview(tealView)
        view.addSubview(name)
        view.addSubview(status)
        view.addSubview(species)
        view.addSubview(gender)
        view.addSubview(avatar)
        view.addSubview(type)
        view.addSubview(origin)
        
        //AutoLayout
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            avatar.leadingAnchor.constraint(equalTo:  view.leadingAnchor),
            avatar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            avatar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            tealView.leadingAnchor.constraint(equalTo:  view.leadingAnchor),
            tealView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tealView.topAnchor.constraint(equalTo: avatar.bottomAnchor),
            tealView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            name.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 30),
            
            status.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            status.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8),
            
            gender.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            gender.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 8),
            
            species.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            species.topAnchor.constraint(equalTo: gender.bottomAnchor, constant: 8),
            
            origin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            origin.topAnchor.constraint(equalTo: species.bottomAnchor, constant: 8),
            
            type.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            type.topAnchor.constraint(equalTo: origin.bottomAnchor, constant: 8),
        ])
    }




}
