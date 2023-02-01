// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loan = try? JSONDecoder().decode(Loan.self, from: jsonData)

import Foundation

// MARK: - Loan
struct Loan: Codable {
    let paging: Paging?
    let loans: [LoanElement]?
}

// MARK: - LoanElement
struct LoanElement: Codable, Identifiable {
    let id: Int?
    let name: String?
    let use: String?
    let location: Location?
    let loanAmount: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, use, location
        case loanAmount = "loan_amount"
    }
}



// MARK: - Location
struct Location: Codable {
    let countryCode, country, town: String?

    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case country, town
    }
}

// MARK: - Paging
struct Paging: Codable {
    let page, total, pageSize, pages: Int?

    enum CodingKeys: String, CodingKey {
        case page, total
        case pageSize = "page_size"
        case pages
    }
}
