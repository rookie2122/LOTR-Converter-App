//
//  ExchangeInfo.swift
//  LOTRconverter17
//
//  Created by SENA on 1.08.2024.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack{
            
            // background
            
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                // title text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                //description text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .padding()
                    .font(.title2)
                
                // exchange rates
                ExtractedView(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies ", rightImage: .goldpenny)
                
                ExtractedView(leftImage: .goldpenny, text: "1 Gold Pennie = 4 Silver Pieces", rightImage: .silverpiece)
                
                ExtractedView(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                
                ExtractedView(leftImage: .silverpenny, text: "1 Silver Pennie = 4 Copper Pennies", rightImage: .copperpenny)
                
                // done button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                
            }
            
        }
        
        .foregroundColor(.black)
        
    }
}

#Preview {
    ExchangeInfo()
}



struct ExtractedView: View {
    let leftImage : ImageResource
    let text : String
    let rightImage : ImageResource
    var body: some View {
        HStack{
            // left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // exchange rate text
            Text(text)
            
            //right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}
#Preview {
    ExtractedView(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies ", rightImage: .goldpenny)
}
