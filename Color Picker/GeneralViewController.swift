//
//  GeneralViewController.swift
//  Color Picker
//
//  Created by Илья Маркелов on 06.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(for color: UIColor)
}

class GeneralViewController: UIViewController {
    
    @IBOutlet var generalView: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingVC = segue.destination as! SettingsViewController
        settingVC.delegate = self
        settingVC.generalViewColor = view.backgroundColor
    }

}

extension GeneralViewController: SettingsViewControllerDelegate {
    func setColor(for color: UIColor) {
        generalView.backgroundColor = color
    }
}
