//
//  DetailController.swift
//  TWM
//
//  Created by Sabi on 27.02.2022.
//

import Foundation
import UIKit

class WineDetailController: UIViewController {
    
    var wines = WineManager()
    
    @IBOutlet weak var imageWine: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUserInterface()
    }
    
    func updateUserInterface() {
        wines.getData {
            DispatchQueue.main.async {
                self.titleLabel.text = self.wines.array[RandomInt.intToDetails].title
                self.descriptionLabel.text = self.wines.array[RandomInt.intToDetails].description
                let url = URL(string: self.wines.array[RandomInt.intToDetails].imageUrl)
                let data = try? Data(contentsOf: url!)
                self.imageWine.image = UIImage(data: data!)
            }
        }
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
