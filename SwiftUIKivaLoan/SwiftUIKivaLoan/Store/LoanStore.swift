//
//  LoanStore.swift
//  SwiftUIKivaLoan
//
//  Created by Marble Interactive SL on 1/2/23.
//

import Foundation
import Combine

class LoanStore: ObservableObject {    
    @Published var loans: [LoanElement] = []
    private var suscriptors = Set<AnyCancellable>()
    
    private var cachedLoans: [LoanElement] = []
    
    init(){
        self.loadLoans()
    }
    
    func loadLoans() {
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getLoans())
            .receive(on: DispatchQueue.main)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: Loan.self, decoder: JSONDecoder())
            .map(\.loans)
            .sink { completion in
               print(completion)
            } receiveValue: { data in
                
                if let loans = data {
                    self.loans = loans
                    self.cachedLoans = self.loans
                }
            }
            .store(in: &suscriptors)
    }
    
    func filterLoans(maxAmount: Int) {
        self.loans = self.cachedLoans.filter({ $0.loanAmount! < maxAmount })
    }
    
}
