//
//  PaginationFetching.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 29.10.22.
//

import Foundation

extension CharactersMainMenuViewController{
    public func isLoadingMore(to loadingStatus: Bool) {
        if loadingStatus {
         //   loadingIndicator.startAnimating()
            self.getCharacterInfo(self.counter)
            self.counter += 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.myCollectionView.reloadData()
            })
            
        } else {
       //     loadingIndicator.stopAnimating()
       //     loadingIndicator.hidesWhenStopped = true
        }
    }
}
