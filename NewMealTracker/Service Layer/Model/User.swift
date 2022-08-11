//
//  User.swift
//  NewMealTracker
//
//  Created by Dana Hindenburg on 8/9/22.
//

import Foundation

struct User: Identifiable, Codable {
    var id: Int?
    var username: String?
    var password: String?
    var RefreshToken: String?
    var IdToken: String?
    var AccessToken: String?
    var pointsPerWeek: Int?
}
