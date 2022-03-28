//
//  WineManager.swift
//  TWM
//
//  Created by Sabi on 27.02.2022.
//

import Foundation

struct MyVariables {
    static var urlsh = "https://api.spoonacular.com/food/wine/recommendation?apiKey=da330f7a8cb242c98f4e97d0da51acae&wine=Merlot&number=4&maxPrice=100&minRating=0.8"
}

class WineManager {
    
    func createUniqueUrl(for wine: String, for price: String, for rating: String) {
        MyVariables.urlsh = "https://api.spoonacular.com/food/wine/recommendation?apiKey=da330f7a8cb242c98f4e97d0da51acae&wine=\(wine)&number=20&maxPrice=\(price)&minRating=\(rating)"
    }
    
    var array: [WineData] = []
    var totalFound: Int = 1
    
    let typeArray = ["Malbec", "Cabernet%20Sauvignon", "Tempranillo", "Chardonnay", "Syrah", "Garnacha", "Zinfandel", "Pinot%20Noir", "Moscato"]
    
    func getData(completed: @escaping ()->()) {
        
        print("We are accessing the url \(MyVariables.urlsh)")
        
        guard let url = URL(string: MyVariables.urlsh) else {
            print("ERROR: Could not create a URL from \(MyVariables.urlsh)")
            completed()
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR:  \(error.localizedDescription)")
            }
            
            do {
                let returned = try JSONDecoder().decode(ReturneD.self, from: data!)
                self.array = returned.recommendedWines
                self.totalFound = returned.totalFound
                
            } catch {
                print("ERROR:  \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
