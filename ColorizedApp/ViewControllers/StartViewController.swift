//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Irina Muravyeva on 09.10.2023.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setViewColor(with color: UIColor)
}

final class StartViewController: UIViewController {

    var color: UIColor!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewVC = segue.destination as? SettingsViewController else { return}
        viewVC.currentColor = view.backgroundColor
        viewVC.delegate = self
    }
    
}

// MARK: - ViewControllerDelegate
extension StartViewController: SettingsViewControllerDelegate {
    func setViewColor(with color: UIColor) {
        view.backgroundColor = color
    }
}
