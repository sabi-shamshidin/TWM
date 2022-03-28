//
//  WineController.swift
//  TWM
//
//  Created by Sabi on 27.02.2022.
//

import Foundation
import UIKit

class WineController: UIViewController {
    
    let wineManager = WineManager()
    var maxPrice = "30"
    var minRating = "0.1"
    var tit = ""
    
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var stepperLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typePicker.dataSource = self
        typePicker.delegate = self
    }
    @IBAction func stepperValue(_ sender: UIStepper) {
        stepperLabel.text = String(format: "%.0f", sender.value)
        maxPrice = String(format: "%.0f", sender.value)
    }
    @IBAction func raitingSlider(_ sender: UISlider) {
        minRating = String(format: "%.1f", sender.value)
    }
    @IBAction func findPressed(_ sender: UIButton) {
        wineManager.createUniqueUrl(for: tit, for: maxPrice, for: minRating)
    }
}

extension WineController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
      
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return wineManager.typeArray.count
    }
      
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return wineManager.typeArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tit = String(wineManager.typeArray[row])
    }
}
