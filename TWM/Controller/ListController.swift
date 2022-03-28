//
//  ListController.swift
//  TWM
//
//  Created by Sabi on 28.02.2022.
//

import Foundation
import UIKit

struct RandomInt {
    static var randomInt1 = Int.random(in: 0..<3)
    static var randomInt2 = Int.random(in: 3..<5)
    static var randomInt3 = Int.random(in: 5..<7)
    static var randomInt4 = Int.random(in: 7..<10)
    static var randomInt5 = Int.random(in: 10..<12)
    static var randomInt6 = Int.random(in: 12..<15)
    static var intToDetails = 1
}

class ListController: UIViewController {
    
    var wines = WineManager()
    
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var image12: UIImageView!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var image13: UIImageView!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var image21: UIImageView!
    @IBOutlet weak var label21: UILabel!
    @IBOutlet weak var image22: UIImageView!
    @IBOutlet weak var label22: UILabel!
    @IBOutlet weak var image23: UIImageView!
    @IBOutlet weak var label23: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wines.getData {
            DispatchQueue.main.async {
                self.label11.text = self.wines.array[RandomInt.randomInt1].title
                // self.descriptionLabel.text = self.wines.array[randomInt].description
                let url = URL(string: self.wines.array[RandomInt.randomInt1].imageUrl)
                let data = try? Data(contentsOf: url!)
                self.image11.image = UIImage(data: data!)
            }
        }
        
        wines.getData {
            DispatchQueue.main.async {
                self.label12.text = self.wines.array[RandomInt.randomInt2].title
                // self.descriptionLabel.text = self.wines.array[randomInt].description
                let url = URL(string: self.wines.array[RandomInt.randomInt2].imageUrl)
                let data = try? Data(contentsOf: url!)
                self.image12.image = UIImage(data: data!)
            }
        }
        
        wines.getData {
            DispatchQueue.main.async {
                self.label13.text = self.wines.array[RandomInt.randomInt3].title
                // self.descriptionLabel.text = self.wines.array[randomInt].description
                let url = URL(string: self.wines.array[RandomInt.randomInt3].imageUrl)
                let data = try? Data(contentsOf: url!)
                self.image13.image = UIImage(data: data!)
            }
        }
        
        wines.getData {
            DispatchQueue.main.async {
                self.label21.text = self.wines.array[RandomInt.randomInt4].title
                // self.descriptionLabel.text = self.wines.array[randomInt].description
                let url = URL(string: self.wines.array[RandomInt.randomInt4].imageUrl)
                let data = try? Data(contentsOf: url!)
                self.image21.image = UIImage(data: data!)
            }
        }
        
        wines.getData {
            DispatchQueue.main.async {
                self.label22.text = self.wines.array[RandomInt.randomInt5].title
                // self.descriptionLabel.text = self.wines.array[randomInt].description
                let url = URL(string: self.wines.array[RandomInt.randomInt5].imageUrl)
                let data = try? Data(contentsOf: url!)
                self.image22.image = UIImage(data: data!)
            }
        }
        
        wines.getData {
            DispatchQueue.main.async {
                self.label23.text = self.wines.array[RandomInt.randomInt6].title
                // self.descriptionLabel.text = self.wines.array[randomInt].description
                let url = URL(string: self.wines.array[RandomInt.randomInt6].imageUrl)
                let data = try? Data(contentsOf: url!)
                self.image23.image = UIImage(data: data!)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails1" {
            RandomInt.intToDetails = RandomInt.randomInt1
        } else if segue.identifier == "ShowDetails2" {
            RandomInt.intToDetails = RandomInt.randomInt2
        } else if segue.identifier == "ShowDetails3" {
            RandomInt.intToDetails = RandomInt.randomInt3
        } else if segue.identifier == "ShowDetails4" {
            RandomInt.intToDetails = RandomInt.randomInt4
        } else if segue.identifier == "ShowDetails5" {
            RandomInt.intToDetails = RandomInt.randomInt5
        } else if segue.identifier == "ShowDetails6" {
            RandomInt.intToDetails = RandomInt.randomInt6
        }
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
