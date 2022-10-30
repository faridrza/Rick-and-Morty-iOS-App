//
//  GetCharacterInfo.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 29.10.22.
//

import Foundation
import Alamofire

extension CharactersMainMenuViewController : MyDataSendingDelegateProtocol{

    
    
    public func getCharacterInfo(_ count : Int = 1){
        if count < 2 {
            DispatchQueue.main.async {
                AF.request("\(URL.mainURL)\(count)", method: .get).responseDecodable(of: NetworkingModel.self) { response in
                    switch response.result {
                    case .success(let data) :
                        self.myCell = data
                    case .failure(let error) :
                        print("erron at \((#file as NSString).lastPathComponent)", error)
                        
                    }
                    self.myCollectionView.reloadData()
                    
                }
            }
        }
        else {
            DispatchQueue.main.async {
                AF.request("\(URL.mainURL)\(count)", method: .get).responseDecodable(of: NetworkingModel.self) { response in
                    switch response.result {
                    case .success(let data) :
                        self.myCell?.results?.append(contentsOf: data.results ?? [Result]())
                    case .failure(let error) :
                        print("erron at \((#file as NSString).lastPathComponent)", error)
                        
                    }
                    
                }
            }
        }
        
    }


    func sendDataToFirstViewController(status: String, species: String, gender: String) {
            let url = URL(string: "https://rickandmortyapi.com/api/character/?status=\(status)&species=\(species)&gender=\(gender)")!

            DispatchQueue.main.async{
                AF.request(url, method: .get).responseDecodable(of: NetworkingModel.self) { response in
                    switch response.result {
                    case .success(let data) :
                        self.myCell = data
                    case .failure(let error) :
                        print("erron at \((#file as NSString).lastPathComponent)", error)
                        
                    }
                    self.myCollectionView.reloadData()
                    
                }
            }
        
        myCollectionView.reloadData()
        
    }
    
    
    func filterByLetter(name: String) {
            let url = URL(string: "https://rickandmortyapi.com/api/character/?name=\(name)")!

            DispatchQueue.main.async{
                AF.request(url, method: .get).responseDecodable(of: NetworkingModel.self) { response in
                    switch response.result {
                    case .success(let data) :
                        self.myCell = data
                    case .failure(let error) :
                        print("erron at \((#file as NSString).lastPathComponent)", error)
                        
                    }
                    self.myCollectionView.reloadData()
                    
                }
            }
        
        myCollectionView.reloadData()
        
    }
    
    
}

