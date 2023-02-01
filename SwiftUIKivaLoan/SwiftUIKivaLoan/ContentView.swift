//
//  ContentView.swift
//  SwiftUIKivaLoan
//
//  Created by Marble Interactive SL on 1/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loanStore = LoanStore()
    
    @State private var filterEnabled = false
    @State private var maximunLoanAmount = 10000.0
    
    var body: some View {
        NavigationStack {
            
            VStack {
                if filterEnabled {
                    LoanFilterView(amount: self.$maximunLoanAmount)
                        .transition(.opacity)
                }
                
                List(loanStore.loans) { loan in
                    LoanCellView(loan: loan)
                        .padding(.vertical, 5)
                }
            }
            .navigationTitle("Kiva Loan")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation(.linear) {
                            self.filterEnabled.toggle()
                            self.loanStore.filterLoans(maxAmount: Int(self.maximunLoanAmount))
                        }
                    } label: {
                        Text("Filter")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
