//
//  ContentView.swift
//  SwiftUIKivaLoan
//
//  Created by Marble Interactive SL on 1/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loanStore = LoanStore()
    
    var body: some View {
        NavigationStack {
            List(loanStore.loans) { loan in
                LoanCellView(loan: loan)
                    .padding(.vertical, 5)
            }
            .navigationTitle("Kiva Loan")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
