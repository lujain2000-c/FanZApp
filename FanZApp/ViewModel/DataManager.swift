//
//  DataManager.swift
//  FanZApp
//
//  Created by لجين إبراهيم الكنهل on 18/12/1445 AH.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

class DataManager: ObservableObject {
    @Published var players: [PlayerModel] = [PlayerModel(country: "", image: "", name: "", number: "", position: "", price: "", rating: 0.0, team: "")]
    @Published var player = PlayerModel(country: "", image: "", name: "", number: "", position: "", price: "", rating: 0.0, team: "")
    
    let db = Firestore.firestore()
    
    
    func fetchAllPlayer(){ // تم
            
                    self.db.collection("player").getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            var players1: [PlayerModel] = []
                            for doc in querySnapshot!.documents{
                                let data = doc.data()
                                let playerCountry = data["country"] as! String
                                let playerImage = data["image"] as! String
                                let playerName = data["name"] as! String
                                let playerNumber = data["number"] as! String
                                let playerPrice = data["price"] as! String
                                let playerPosition = data["position"] as! String
                                let playerRating = data["rating"] as! Double
                                let playerTeam = data["team"] as! String
                               let player = PlayerModel(country: playerCountry, image: playerImage, name: playerName, number: playerNumber, position: playerPosition, price: playerPrice, rating: playerRating, team: playerTeam)
                                players1.append(player)
                                
                            }
                            self.players = players1
                            
                        }
                    }
              
            
          
        }
    
    func fetchPlayer(playerNum: String){
            

         
        if(playerNum == "7"){
            self.db.collection("player").document("1").getDocument { (document, error) in
                if let error = error {
                    print("Error getting documents: (error)")
                } else {
                    guard let document = document, document.exists else {
                        print("No matching documents.")
                        return
                    }
                   
                    
                    let data = document.data()
                    let playerCountry = data?["country"] as! String
                    let playerImage = data?["image"] as! String
                    let playerName = data?["name"] as! String
                    let playerNumber = data?["number"] as! String
                    let playerPrice = data?["price"] as! String
                    let playerPosition = data?["position"] as! String
                    let playerRating = data?["rating"] as! Double
                    let playerTeam = data?["team"] as! String
                    self.player = PlayerModel(country: playerCountry, image: playerImage, name: playerName, number: playerNumber, position: playerPosition, price: playerPrice, rating: playerRating, team: playerTeam)
                    
                    
                    // }
                }
            }
        } else {
            self.db.collection("player").document("2").getDocument { (document, error) in
                if let error = error {
                    print("Error getting documents: (error)")
                } else {
                    guard let document = document, document.exists else {
                        print("No matching documents.")
                        return
                    }
                    
                    let data = document.data()
                    let playerCountry = data?["country"] as! String
                    let playerImage = data?["image"] as! String
                    let playerName = data?["name"] as! String
                    let playerNumber = data?["number"] as! String
                    let playerPrice = data?["price"] as! String
                    let playerPosition = data?["position"] as! String
                    let playerRating = data?["rating"] as! Double
                    let playerTeam = data?["team"] as! String
                    self.player = PlayerModel(country: playerCountry, image: playerImage, name: playerName, number: playerNumber, position: playerPosition, price: playerPrice, rating: playerRating, team: playerTeam)
                    
                    
                    // }
                }
            }
            
        }
 
        
            
            
        }
   
}
