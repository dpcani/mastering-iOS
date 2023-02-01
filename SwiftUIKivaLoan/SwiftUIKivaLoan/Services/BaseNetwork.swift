//
//  BaseNetwork.swift
//  SwiftUIKivaLoan
//
//  Created by Marble Interactive SL on 1/2/23.
//

import Foundation

let server = "https://api.kivaws.org/v1/"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum endpoints: String {
    case kivaLoanURL = "loans/newest.json"
}

struct BaseNetwork {
    func getLoans() -> URLRequest {
        let url: String = "\(server)\(endpoints.kivaLoanURL.rawValue)"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        
        return request
    }
}

