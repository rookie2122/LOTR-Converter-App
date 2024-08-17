//
//  SelectCurrency.swift
//  LOTRconverter17
//
//  Created by SENA on 3.08.2024.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var topCurrency : Currency
    @Binding var bottomCurrency : Currency
    
    
    var body: some View {
        ZStack{
            // parchment bg image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                //text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    
                //currency icons
                IconGrid(currency: $topCurrency)
                
                //text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                
                //currency icons
                IconGrid(currency: $bottomCurrency)
                
                
                //done button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPiece))
}

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let currencyName: String
    var body: some View {
        ZStack(alignment:.bottom){
            //currency image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            //currency text
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .background(.brown .opacity(0.75))
                .frame(maxWidth: .infinity)
        }
        .padding(3)
        .frame(width: 100,height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25 ))
    }
}
#Preview {
    CurrencyIcon(currencyImage: .goldpenny, currencyName: "Gold Penny")
}
