//
//  UserService.swift
//  NewMealTracker
//
//  Created by Dana Hindenburg on 8/9/22.
//

import Foundation
import Alamofire

class UserService: APIHandler, ObservableObject {
    @Published var user: User?
    @Published var isLoading = false
    
    override init() {
        super.init()
        getUser()
    }
    
    func getUser() {
        isLoading = true
        let url = "https://random.dog/woof.json"
        
        AF.request(url, method: .get).responseDecodable { [weak self] (response: DataResponse<User, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? User else {
                weakSelf.isLoading = false
                return
            }
            
            weakSelf.isLoading = false
            weakSelf.user = response
        }
    }
}
