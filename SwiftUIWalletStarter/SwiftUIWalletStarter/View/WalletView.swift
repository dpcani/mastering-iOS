//
//  WalletView.swift
//  SwiftUIWalletStarter
//
//  Created by Marble Interactive SL on 30/1/23.
//

import SwiftUI

struct WalletView: View {
    var cards: [Card] = testCards
    
    var body: some View {
        VStack {
            TopNavBar()
                .padding(.bottom)
            
            Spacer()
            
            ZStack {
                ForEach(cards) { card in
                    CardView(card: card)
                        .padding(.horizontal, 35)
                }
            }
            Spacer()
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}


struct TopNavBar: View {
    var body: some View {
        HStack {
            Text("Wallet")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
            
            Spacer()
            
            Image(systemName: "plus.circle.fill")
                .font(.system(.title))
        }
        .padding()
        .padding(.top, 20)
    }
}
