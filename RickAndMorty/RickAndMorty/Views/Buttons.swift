//
//  Buttons.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 27.10.22.
//

import UIKit

extension CharactersMainMenuViewController {
    
    
    @objc public func rightBarButtonFilter(){
        
        let filterVC = FilterVC()
        switch self.view.bounds.height{
        case 1000...2000 : filterVC.modalPresentationStyle = .automatic
        default : filterVC.modalPresentationStyle = .popover
        }
        filterVC.delegate = self
        self.present(filterVC, animated: true)
    }
}
