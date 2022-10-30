//
//  FilterVC.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 30.10.22.
//

import UIKit

class FilterVC : UIViewController {

    
    
    var delegate: MyDataSendingDelegateProtocol? = nil

    
    var statusData = ["Alive","Dead","Unknown",""]
    var selectedStatus = "Alive"
    
    var speciesData = ["Human","Alien","Humanoid",""]
    var selectedSpecies = "Human"

    var genderData = ["Male","Female","Unknown",""]
    var selectedGender = "Male"

    
    
    
    var statusPicker1 : UIPickerView = {
        var view = UIPickerView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var statusLabel : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Select Status"
        return view
    }()
    var genderPicker2 : UIPickerView = {
        var view = UIPickerView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var genderLabel : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Select Gender"
        return view
    }()
    var speciesPicker3 : UIPickerView = {
        var view = UIPickerView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var speciesLabel : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Select Species"
        return view
    }()
    
    var filterBtn : UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Filter", for: .normal)
        view.backgroundColor = .mainGreen
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.addTarget(self, action: #selector(filterBtnTap), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusPicker1.delegate = self
        statusPicker1.dataSource = self
        
        genderPicker2.delegate = self
        genderPicker2.dataSource = self
        
        speciesPicker3.delegate = self
        speciesPicker3.dataSource = self
        
        statusPicker1.tag = 1
        genderPicker2.tag = 2
        speciesPicker3.tag = 3

        
        ///Making some nice looking blur effect
        view.backgroundColor = .customTeal
        view.alpha = 0.9
        let effect: UIBlurEffect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height)
        self.view.addSubview(effectView)
        
        
        self.view.addSubview(statusPicker1)
        view.addSubview(statusLabel)
        view.addSubview(genderPicker2)
        view.addSubview(genderLabel)
        view.addSubview(speciesPicker3)
        view.addSubview(speciesLabel)
        view.addSubview(filterBtn)
        
        NSLayoutConstraint.activate([
            statusPicker1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            statusPicker1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            statusPicker1.bottomAnchor.constraint(equalTo: filterBtn.topAnchor, constant: -40),
            statusPicker1.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: statusPicker1.topAnchor,constant: -6),
            
            genderPicker2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            genderPicker2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            genderPicker2.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -20),
            genderPicker2.heightAnchor.constraint(equalToConstant: 50),
            
            genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderLabel.bottomAnchor.constraint(equalTo: genderPicker2.topAnchor,constant: -6),
            
            speciesPicker3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            speciesPicker3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            speciesPicker3.bottomAnchor.constraint(equalTo: genderLabel.topAnchor, constant: -20),
            speciesPicker3.heightAnchor.constraint(equalToConstant: 50),
            
            speciesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            speciesLabel.bottomAnchor.constraint(equalTo: speciesPicker3.topAnchor,constant: -6),
            
            filterBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            filterBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            filterBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            filterBtn.heightAnchor.constraint(equalToConstant: 50),
   

        ])
    }
    

}
