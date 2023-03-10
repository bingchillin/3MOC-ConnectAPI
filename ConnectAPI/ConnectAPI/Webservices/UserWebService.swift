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
    class func registerUser(parameters: String) {
            guard let userURL = URL(string: "http://localhost:8888/api/controllers/users/post.php") else {
                        print("Not found RegisterUser URL")
                        return
                    }
            let postData = parameters.data(using: .utf8)
        
            var request = URLRequest(url: userURL)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            request.httpMethod = "POST"
            request.httpBody = postData

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              guard let data = data else {
                print(String(describing: error))
                return
              }
              print(String(data: data, encoding: .utf8)!)
            }

            task.resume()
        }
    
    class func loginUser(parameters: String) {
        
        guard let userURL = URL(string: "http://localhost:8888/api/controllers/login/post.php") else {
                    print("Not found LoginUser URL")
                    return
                }
        let postData = parameters.data(using: .utf8)
        var request = URLRequest(url: userURL)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            
          //print(String(data: data, encoding: .utf8)!)
            
            if let responseString = String(data: data, encoding: .utf8) {
                
                guard let jsonData = responseString.data(using: .utf8) else {
                    print("Erreur lors de la conversion de la cha??ne en donn??es JSON")
                    return
                }
                
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                        if let id = jsonObject["id"] as? String {
                            print(id)
                            UserDefaults.standard.set(id, forKey: "uId")
                        }
                    }
                } catch {
                    print("Erreur lors de l'analyse de la r??ponse JSON : \(error.localizedDescription)")
                }
            }
        }

        task.resume()
    }

    class func logoutUser(parameters: String) {

        guard let userURL = URL(string: "http://localhost:8888/api/controllers/logout/delete.php") else {
                    print("Not found LoginOut URL")
                    return
                }
        
        let postData = parameters.data(using: .utf8)
        var request = URLRequest(url: userURL)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
}
