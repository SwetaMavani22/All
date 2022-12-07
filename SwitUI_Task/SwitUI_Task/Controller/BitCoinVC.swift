//
//  BitCoinVC.swift
//  SwitUI_Task
//
//  Created by Mavani on 22/11/22.
//

import SwiftUI

struct BitCoinVC: View {
    
    @State var data : CurrencyModel?
    @State var showAnswer = false
    @State var toggleText = false
    
    var body: some View {
        
        ZStack {
            Color.purple.opacity(0.4).ignoresSafeArea()
            VStack {
                Image("ic_Alert")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: Alignment.center).padding(.all , 15.0)
                
                Text("Hey there! The current price of bitcoin is below").font(.system(size: 30)).multilineTextAlignment(.center).padding([.bottom] , 50.0)
                
                Text("Price").font(.system(size: 30)).multilineTextAlignment(.center).padding(.all , 5.0)
                
                Text(toggleText ? "$ \(self.data?.bpi.usd.rate ?? "")" : "Loading.....").multilineTextAlignment(.center).font(.system(size: 30, weight: .bold, design: .default)).padding([.bottom] , 50.0)
                
                HStack {
                    Button(action: {
                        self.showAnswer = false
                        self.toggleText.toggle()
                        print("sign up bin tapped")
                        self.CallApi()
                    }) {
                        Text("Refresh Price")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.system(size: 20 , weight: .bold))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white, lineWidth: 0)
                            )
                    }
                    .background(toggleText ? Color.purple : Color.init(red: 186.0/255.0, green: 134.0/255.0, blue: 255.0/255.0).opacity(0.5)) // If you have this
                    .cornerRadius(25)
                }.padding(.all , 10.0)
            }
        }.onAppear() {
            self.CallApi()
        }
    }
    
    func CallApi() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            Api().loadData { (dataaa) in
                self.data = dataaa
                self.showAnswer = true
                self.toggleText.toggle()
            }
        }
    }
}

struct BitCoinVC_Previews: PreviewProvider {
    static var previews: some View {
        BitCoinVC()
    }
}
