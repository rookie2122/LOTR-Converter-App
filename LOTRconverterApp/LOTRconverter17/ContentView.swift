//
//  ContentView.swift
//  LOTRconverter17
//
//  Created by SENA on 24.07.2024.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var showexchangeinfo = false
    @State var showSelectcurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    var body: some View {
        ZStack{
            //background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack{
                
                //prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                //currency exchange
                    Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                //currency conversion sectionf
                
                
                HStack{
                    //left conversion section
                    
                    VStack{
                        //currency
                        
                        HStack{
                            
                            //currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //currency text
                            Text(leftCurrency.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        
                        .padding(.bottom , -5)
                        .onTapGesture {
                            showSelectcurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        //text field
                       TextField("amount", text:$leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                        
                    }
                    
                    //equel sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    //right conversion section
                    VStack{
                        //currency
                        HStack{
                            //currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        
                        .padding(.bottom , -5)
                        .onTapGesture {
                            showSelectcurrency.toggle()
                        }
                        
                        //text field
                        TextField("amount", text:$rightAmount)
                             .textFieldStyle(.roundedBorder)
                             .multilineTextAlignment(.trailing)
                             .focused($rightTyping)
                             .keyboardType(.decimalPad)
                            
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                //info button
                HStack {
                    Spacer()
                    
                    Button{
                        showexchangeinfo.toggle()
                    }label:{
                            Image(systemName: "info.circle.fill")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                    }
                    .padding(.trailing)
                    
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount){
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        
        .onChange(of: rightAmount){
            if rightTyping{
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency){ 
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency){
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        
        .sheet(isPresented: $showexchangeinfo){
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectcurrency){
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
