//
//  CurrencyTip.swift
//  LOTRconverter17
//
//  Created by SENA on 15.08.2024.
//

import Foundation
import TipKit

struct CurrencyTip : Tip{
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency screen.")
    
    
}
