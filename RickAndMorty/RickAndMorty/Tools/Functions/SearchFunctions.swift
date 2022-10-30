//
//  SearchFunctions.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 30.10.22.
//

import Foundation
import UIKit

extension CharactersMainMenuViewController: UISearchResultsUpdating,UISearchControllerDelegate{
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else{return print("Error in SearchFunctions")}
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.filterByLetter(name: text)

        })
        
    }
    
    
}
