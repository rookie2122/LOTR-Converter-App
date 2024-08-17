//
//  currency.swift
//  LOTRconverter17
//
//  Created by SENA on 9.08.2024.
//

import SwiftUI

enum Currency:Double, CaseIterable, Identifiable{
    
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    
    var id: Currency{
        self
    }
    
    var image : ImageResource{
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String{
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    
    func convert(_ amountString: String, to currency : Currency) -> String{
        guard let doubleAmount = Double(amountString) else{
            return ""
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format: "%2.f", convertedAmount)
    }
}
