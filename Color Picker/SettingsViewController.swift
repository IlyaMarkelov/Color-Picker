//
//  ViewController.swift
//  Color Picker
//
//  Created by Илья Маркелов on 21.10.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(for color: UIColor)
}

class SettingsViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redRangeLabel: UILabel!
    @IBOutlet var greenRageLabel: UILabel!
    @IBOutlet var blueRageLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    
    @IBOutlet var doneButton: UIButton!
        
    // MARK: - Public properties
    var generalViewColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = generalViewColor
        
        setColorSliders()
        
        redRangeLabel.text = string(from: redSlider)
        redTextField.text = string(from: redSlider)
        
        greenRageLabel.text = string(from: greenSlider)
        greenTextField.text = string(from: greenSlider)

        blueRageLabel.text = string(from: blueSlider)
        blueTextField.text = string(from: blueSlider)
        
        doneButton.layer.cornerRadius = 15
                
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        setColor()
    }

    // MARK: - IB Actions
    @IBAction func redSliderAction() {
        setColor()
        redRangeLabel.text = string(from: redSlider)
        redTextField.text = string(from: redSlider)
    }
    
    @IBAction func greenSliderAction() {
        setColor()
        greenRageLabel.text = string(from: greenSlider)
        greenTextField.text = string(from: greenSlider)
    }
    
    @IBAction func blueSliderAction() {
        setColor()
        blueRageLabel.text = string(from: blueSlider)
        blueTextField.text = string(from: blueSlider)
    }
    
    @IBAction func saveColor() {
        delegate?.setColor(for: colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

extension SettingsViewController {
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    // MARK: - Private Methods
    private func setColorSliders() {
        let ciColor = CIColor(color: generalViewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let floatValue = Float(text), floatValue <= 1 {
            switch textField.tag {
            case 0:
                redSlider.setValue(floatValue, animated: true)
                redRangeLabel.text = string(from: redSlider)
                redTextField.text = string(from: redSlider)
            case 1:
                greenSlider.setValue(floatValue, animated: true)
                greenRageLabel.text = string(from: greenSlider)
                greenTextField.text = string(from: greenSlider)
            case 2:
                blueSlider.setValue(floatValue, animated: true)
                blueRageLabel.text = string(from: blueSlider)
                blueTextField.text = string(from: blueSlider)
            default: break
            }
            
            setColor()
            return
        }
        
        showAlert(title: "Incorrect format!", message: "Please enter correct value")
    }
}


