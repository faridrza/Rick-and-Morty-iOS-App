//
//  CollectionViewFunctions.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 28.10.22.
//

import UIKit
import SDWebImage
extension CharactersMainMenuViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCell?.results?.count ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as? MyCollectionViewCell
        cell?.layer.cornerRadius = 8
        cell?.clipsToBounds = true
        cell?.name.text =    myCell?.results?[indexPath.row].name
        cell?.gender.text =  myCell?.results?[indexPath.row].gender
        cell?.species.text = myCell?.results?[indexPath.row].species
        cell?.status.text =  myCell?.results?[indexPath.row].status
        cell?.avatar.sd_setImage(with: URL(string: myCell?.results?[indexPath.row].image ?? "https://rickandmortyapi.com/api/character/avatar/13.jpeg"))
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.view.bounds.height < 1000 {
            let width = self.view.frame.width/2 - 24 //for equal amount of margin
            let height: CGFloat = self.view.frame.height / 4.44
            
            return CGSize(width: width, height: height)
        }
        else{
            let width = self.view.frame.width/4 - 24 //for iPad
            let height: CGFloat = self.view.frame.height / 4.44
            
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 16, bottom: 0, right: 16)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == ((myCell?.results?.count ?? 19) - 1) {
            isLoadingMore(to: true)
        } else {
            isLoadingMore(to: false)
        }
    }
    
    @objc func refreshFunc(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.getCharacterInfo(1)
            self.myCollectionView.refreshControl?.endRefreshing()
            self.myCollectionView.reloadData()
        })
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        toDetailsVC(indexPath)
    }
    @objc func toDetailsVC(_ indexPath : IndexPath){
        let vc = DetailsVC()
        if myCell?.results?[indexPath.row].type == "" {
            vc.type.isHidden = true
        }
        vc.navigationItem.title = "\(myCell?.results?[indexPath.row].name ?? "Name")"
        vc.name.text =    "Name : \(myCell?.results?[indexPath.row].name ?? "Name")"
        vc.gender.text =  "Gender : \(myCell?.results?[indexPath.row].gender ?? "Gender")"
        vc.species.text = "Species : \(myCell?.results?[indexPath.row].species ?? "Species")"
        vc.status.text =  "Status : \(myCell?.results?[indexPath.row].status ?? "Status")"
        vc.origin.text = "Origin : \(myCell?.results?[indexPath.row].origin?.name ?? "Status")"
        vc.type.text = "Type : \(myCell?.results?[indexPath.row].type ?? "Status")"
        
        vc.avatar.sd_setImage(with: URL(string: myCell?.results?[indexPath.row].image ?? "https://rickandmortyapi.com/api/character/avatar/13.jpeg"))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
