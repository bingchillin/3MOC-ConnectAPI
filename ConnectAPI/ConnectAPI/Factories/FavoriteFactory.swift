//
//  FavoriteFactory.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 07/03/2023.
//

import Foundation

class FavoriteFactory {
    
    class func favorite(from dict: [String: Any]) -> Favorite? {
        guard let uId = dict["id_user"] as? Int,
              let rId = dict["id_recipe"] as? Int else {
            return nil
        }
        return Favorite(id_user: uId, id_recipe: rId)
    }
    
    class func favorites(from arr: [ [String: Any ] ]) -> [Favorite] {
        return arr.compactMap { dict in
            return favorite(from: dict)
        }
    }
}
