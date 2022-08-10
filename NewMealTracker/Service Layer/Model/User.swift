//
//  User.swift
//  NewMealTracker
//
//  Created by Dana Hindenburg on 8/9/22.
//

import Foundation

struct User: Identifiable, Decodable {
    var id: Int
    var username = ""
    var password = ""
    var refreshToken = ""
    var idToken = ""
    var pointsPerWeek = 0
}
