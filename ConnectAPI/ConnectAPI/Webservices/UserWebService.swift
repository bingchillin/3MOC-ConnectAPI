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
          print(String(data: data, encoding: .utf8)!)
            /*
            let defaults = UserDefaults.standard

            defaults.set(data, forKey: "userId")
            defaults.synchronize()
            let test = "1"
            if test != defaults.string(forKey: "userId") {
                print(test)
            }
             */
        }

        task.resume()
    }

    class func logoutUser() {

        guard let userURL = URL(string: "http://localhost:8888/api/controllers/login/post.php") else {
                    print("Not found LoginOut URL")
                    return
                }
        let defaults = UserDefaults.standard
        let postData = (defaults.string(forKey: "userId"))!.data(using: .utf8)
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
