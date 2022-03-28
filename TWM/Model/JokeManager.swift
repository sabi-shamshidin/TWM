//
//  JokeManager.swift
//  TWM
//
//  Created by Sabi on 28.02.2022.
//

import Foundation

class JokeManager {
    
    let urlString = "https://api.spoonacular.com/food/jokes/random?apiKey=da330f7a8cb242c98f4e97d0da51acae"
    
    var jokeText: String = ""
    
    func getJoke(completed: @escaping ()->()) {
        print("We are accessing the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            completed()
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR:  \(error.localizedDescription)")
            }
            
            do {
                let returned = try JSONDecoder().decode(JokeData.self, from: data!)
                self.jokeText = returned.text
                
            } catch {
                print("ERROR:  \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
