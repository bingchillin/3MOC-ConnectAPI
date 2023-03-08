//
//  UserWebService.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class UserWebService {
    
    //Recuperer tout les users
    class func getAllUsers(completion: @escaping ([User]?, Error?) -> Void) {
        guard let userURL = URL(string: "http://localhost:8888/api/controllers/users/get.php") else {
            return
        }
        let task = URLSession.shared.dataTask(with: userURL) { data, res, err in
            guard err == nil, let d = data else {
                completion(nil, err)
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: d) as? [ [String: Any] ] else {
                completion(nil, NSError(domain: "com.esgi.user.invalid-json", code: 1))
                return
            }
            let users = UserFactory.users(from: json)
           completion(users, nil) // fin OK
        }
        task.resume()
    }
    
    
    // Inscription
    class func registerUser(parameters: [String: Any]) {
        guard let userURL = URL(string: "http://localhost:8888/api/controllers/users/post.php") else {
            print("Not found RegisterUser URL")
            return
        }
        
        let postData = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: userURL)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: userURL) { data, res, err in
            guard err == nil, let d = data else {
                print("error", err?.localizedDescription ?? "")
                return
            }
            print(String(data: d, encoding: .utf8)!)
        }
        
        task.resume() 
    }
    
    
    
}
