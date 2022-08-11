//
//  UserService.swift
//  NewMealTracker
//
//  Created by Dana Hindenburg on 8/9/22.
//

import Foundation
import Alamofire

class UserService: APIHandler, ObservableObject {
    @Published var user: User
    @Published var isLoading = false
    @Published var registerUser: RegisterUser
    
    override init() {
        self.user = User()
        self.registerUser = RegisterUser();
        super.init()
        getUser()
    }
    
    func getUser() {
        isLoading = true
        let url = "https://m4cnztuipf.execute-api.us-east-1.amazonaws.com/prod/login"
        
        let postParameters = ["username": registerUser.username, "password": registerUser.password]
        
        AF.request(url, method: .post, parameters: postParameters, encoder: JSONParameterEncoder.default, headers: authenticationHeaders()).responseDecodable { [weak self] (response: DataResponse<User, AFError>) in
            guard let weakSelf = self else { return }
            do {
                if let json = try JSONSerialization.jsonObject(with: response.data!) as? [String: Any] {
                        // try to read out a string array
                        print(json)
                    }
            } catch let error as NSError {
                print(error)
            }
            
            
            guard let response = weakSelf.handleResponse(response) as? User else {
                weakSelf.isLoading = false
                return
            }
            
            weakSelf.isLoading = false
            weakSelf.user = response
        }
    }
    
    fileprivate func authenticationHeaders() -> HTTPHeaders {
        var httpHeaders = [String: String]()
        
//        let userSessionToken = User.persistentUserObject().idToken as String
//        httpHeaders["Authorization"] = userSessionToken
        httpHeaders["x-api-key"] = "SDpa29wlasTvnVdwSAvlTeFOjYwMch55dhQdeTa0"
        return HTTPHeaders(httpHeaders)
    }
}
