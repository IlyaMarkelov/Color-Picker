//
//  ViewController.swift
//  Color Picker
//
//  Created by Илья Маркелов on 21.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    @IBOutlet var redRangeLabel: UILabel!
    @IBOutlet var greenRageLabel: UILabel!
    @IBOutlet var blueRageLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1

        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        
//        redRangeLabel.text = String(redSlider.value)

    }

    @IBAction func redSliderAction() {
        redRangeLabel.text = String(format: "%.2f", redSlider.value)
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(redSlider.value),  blue: CGFloat(redSlider.value), alpha: 1.0)
    }
    
    @IBAction func greenSliderAction() {
        greenRageLabel.text = String(format: "%.2f", greenSlider.value)
        colorView.backgroundColor = UIColor(red: CGFloat(greenSlider.value), green: CGFloat(greenSlider.value),  blue: CGFloat(greenSlider.value), alpha: 1.0)
    }
    
    @IBAction func blueSliderAction() {
        blueRageLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
}

