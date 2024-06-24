//
//  PlayerModel.swift
//  FanZApp
//
//  Created by لجين إبراهيم الكنهل on 18/12/1445 AH.
//

import SwiftUI

struct PlayerModel:Identifiable{
    let id = UUID()
    let country: String
    let image: String
    let name: String
    let number: String
    let position: String
    let price: String
    var rating: Double
    let team: String
   
    
}



