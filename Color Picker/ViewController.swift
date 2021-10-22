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
    
    @IBOutlet var cleanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = .black
        
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redRangeLabel.text = String(format: "%.2f", redSlider.value)
        
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenRageLabel.text = String(format: "%.2f", greenSlider.value)

        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueRageLabel.text = String(format: "%.2f", blueSlider.value)
        
        cleanButton.layer.cornerRadius = 15
        
    }

    @IBAction func redSliderAction() {
        setColor()
        redRangeLabel.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        setColor()
        greenRageLabel.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func blueSliderAction() {
        setColor()
        blueRageLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    @IBAction func cleanViewAndSlides() {
        colorView.backgroundColor = .black
        
        redSlider.value = 0
        redRangeLabel.text = String(format: "%.2f", redSlider.value)

        greenSlider.value = 0
        greenRageLabel.text = String(format: "%.2f", greenSlider.value)

        blueSlider.value = 0
        blueRageLabel.text = String(format: "%.2f", blueSlider.value)

    }
    
    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
}

