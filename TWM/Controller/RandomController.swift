//
//  RandomController.swift
//  TWM
//
//  Created by Sabi on 27.02.2022.
//

import Foundation
import UIKit

class RandomController: UIViewController {
    
    var recipes = RandomManager()
    

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeText: UILabel!
    @IBOutlet weak var recipeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipes.getData {
            DispatchQueue.main.async {
                self.recipeLabel.text = self.recipes.recipeArray[0].title
                self.recipeText.text = self.recipes.recipeArray[0].summary
                    .replacingOccurrences(of: "<b>", with: "")
                    .replacingOccurrences(of: "</b>", with: "")
                    .replacingOccurrences(of: "<a", with: "")
                    .replacingOccurrences(of: "href=", with: "")
                    .replacingOccurrences(of: "</a>", with: "")
                    .replacingOccurrences(of: ">", with: "")
                let url = URL(string: self.recipes.recipeArray[0].image)
                let data = try? Data(contentsOf: url!)
                self.recipeImage.image = UIImage(data: data!)
            }
        }
    }
    @IBAction func backPresssed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

