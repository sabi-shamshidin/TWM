//
//  JokeController.swift
//  TWM
//
//  Created by Sabi on 28.02.2022.
//

import Foundation
import UIKit

class JokeController: UIViewController {
    var jokeManager = JokeManager()

    @IBOutlet weak var imageSmile: UIImageView!
    @IBOutlet weak var jokeLabel: UILabel!
    
    let smileyArray = [#imageLiteral(resourceName: "Haha"), #imageLiteral(resourceName: "Smile"), #imageLiteral(resourceName: "HmmSmile"), #imageLiteral(resourceName: "Smiley")]
    let rand = Int.random(in: 0...3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokeManager.getJoke {
            DispatchQueue.main.async {
                self.jokeLabel.text = self.jokeManager.jokeText
            }
        }
        imageSmile.image = smileyArray[rand]
        
    }
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
