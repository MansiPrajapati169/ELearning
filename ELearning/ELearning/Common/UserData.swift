//
//  userdata.swift
//  ELearning
//
//  Created by Mansi Prajapati on 25/05/22.
//

import Foundation
struct UserData: Codable {
    var email: String
    var password: String
}

struct SignInResponse: Codable {
    var token: String
}

struct SignUpResponse: Codable {
    var id: Int
    var token: String
}

struct ErrorResponse: Decodable {
    var error: String
}
