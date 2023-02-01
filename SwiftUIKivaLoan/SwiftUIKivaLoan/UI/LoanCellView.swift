//
//  LoanCellView.swift
//  SwiftUIKivaLoan
//
//  Created by Marble Interactive SL on 1/2/23.
//

import SwiftUI

struct LoanCellView: View {
    
    var loan: LoanElement
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(loan.name ?? "nombre")
                    .font(.system(.headline, design: .rounded))
                    .bold()
                Text(loan.location?.country ?? "country")
                    .font(.system(.subheadline, design: .rounded))
                Text(loan.use ?? "usooo")
                    .font(.system(.body, design: .rounded))
            }
            Spacer()
            VStack {
                Text("$" + String(loan.loanAmount ?? 0))
                    .font(.system(.title, design: .rounded))
                    .bold()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct LoanCellView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCellView(loan: LoanElement(id: 1,
                                       name: "Nombre",
                                       use: "Aqui va el uso",
                                       location: Location(countryCode: "1", country: "Spain", town: "Madrid"),
                                       loanAmount: 250)).previewLayout(.sizeThatFits)
    }
}
