//
//  RecipeWebService.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 08/03/2023.
//
import Foundation

class RecipeWebService {
    
    //Recuperer tout les users
    class func getAllRecipes(completion: @escaping ([Recipe]?, Error?) -> Void) {
        guard let recipeURL = URL(string: "http://localhost:8888/api/controllers/recettes/get.php") else {
            return
        }
        let task = URLSession.shared.dataTask(with: recipeURL) { data, res, err in
            guard err == nil, let d = data else {
                completion(nil, err)
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: d) as? [ [String: Any] ] else {
                completion(nil, NSError(domain: "com.esgi.user.invalid-json", code: 1))
                return
            }
            let recipes = RecipeFactory.recipes(from: json)
            completion(recipes, nil) // fin OK
        }
        task.resume()
    }
    
    
    // Create a recipe
    class func createRecipe(parameters: String) {
        guard let recipeURL = URL(string: "http://localhost:8888/api/controllers/recettes/post.php") else {
            print("Not found createRecipe URL")
            return
        }
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: recipeURL)
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
    
    class func updateRecipebyId(parameters: String) {
        
        guard let recipeURL = URL(string: "http://localhost:8888/api/controllers/recettes/patch.php") else {
            print("Not found updateRecipebyId URL")
            return
        }
        let postData = parameters.data(using: .utf8)
        var request = URLRequest(url: recipeURL)
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
    
    class func deleteRecipebyId(parameters: String) {
        
        guard let recipeURL = URL(string: "http://localhost:8888/api/controllers/recettes/delete.php") else {
            print("Not found deleteRecipebyId URL")
            return
        }
        let postData = parameters.data(using: .utf8)
        var request = URLRequest(url: recipeURL)
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
