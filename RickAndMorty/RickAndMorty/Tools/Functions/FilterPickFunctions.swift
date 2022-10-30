//
//  FilterPickFunctions.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 30.10.22.
//

import Foundation
import UIKit
import Alamofire

protocol MyDataSendingDelegateProtocol {
    func sendDataToFirstViewController(status:String, species:String, gender:String)
}

extension FilterVC : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        switch pickerView  {
        case statusPicker1 : return statusData.count-1
        case genderPicker2 : return genderData.count-1
        case speciesPicker3 : return speciesData.count-1
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView  {
        case statusPicker1 : return statusData[row]
        case genderPicker2 : return genderData[row]
        case speciesPicker3 : return speciesData[row]
        default:
            return "Nothing"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView  {
        case statusPicker1 :   selectedStatus = statusData[row]
        case genderPicker2 :   selectedGender = genderData[row]
        case speciesPicker3 :  selectedSpecies = speciesData[row]
        default:
            break
        }
    }
    
    @objc func filterBtnTap() {
        self.delegate?.sendDataToFirstViewController(status: self.selectedStatus, species: self.selectedSpecies, gender: self.selectedGender)
        self.dismiss(animated: true)
    }
    

    
}
