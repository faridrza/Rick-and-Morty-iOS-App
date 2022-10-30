//
//  CollectionViewCell.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 28.10.22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    //MARK: Variables
    
    static let id = "CustomCellIdentifier"
    private let calculator = FontCalculate()
    
    //Views
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
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    var titleViewEffect : UIVisualEffectView = {
        let view = UIVisualEffectView(effect: .some(UIBlurEffect(style: .regular)))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

     
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        //Adding views
        contentView.addSubview(avatar)
        contentView.addSubview(titleViewEffect)
        contentView.addSubview(name)
        contentView.addSubview(status)
        contentView.addSubview(species)
        contentView.addSubview(gender)
        

        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        //Font resizing
        name.font = .boldSystemFont(ofSize: calculator.overrideTitleFontSize(14))
        status.font = .systemFont(ofSize: calculator.overrideTitleFontSize(10))
        species.font = .systemFont(ofSize: calculator.overrideTitleFontSize(10))
        gender.font = .systemFont(ofSize: calculator.overrideTitleFontSize(10))

        
  
        
        //AutoLayout
        NSLayoutConstraint.activate([
            
            avatar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleViewEffect.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.33),
            titleViewEffect.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleViewEffect.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            name.leadingAnchor.constraint(equalTo: titleViewEffect.leadingAnchor, constant: 5),
            name.topAnchor.constraint(equalTo: titleViewEffect.topAnchor, constant: 5),
            
            status.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            status.centerYAnchor.constraint(equalTo: titleViewEffect.centerYAnchor),
            
            species.leadingAnchor.constraint(equalTo: status.trailingAnchor, constant: 5),
            species.centerYAnchor.constraint(equalTo: titleViewEffect.centerYAnchor),
            
            gender.leadingAnchor.constraint(equalTo: status.leadingAnchor),
            gender.bottomAnchor.constraint(equalTo: titleViewEffect.bottomAnchor, constant: -5),
            
            
            
        ])


    }



}
