//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Irina Muravyeva on 09.10.2023.
//

import UIKit

//protocol SettingsViewControllerDelegate {
//    func setViewColor(withRed: Float, green: Float, blue: Float)
////    func setViewColor(with color: ViewColor)
//}

class StartViewController: UIViewController {

//    var color: ViewColor!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewVC = segue.destination as? SettingsViewController else { return}
        viewVC.currentColor = view.backgroundColor
//        viewVC.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - ViewControllerDelegate
//extension StartViewController: SettingsViewControllerDelegate {
//    func setViewColor(withRed redValue: Float, green greenValue: Float, blue blueValue: Float) {
//        view.backgroundColor = UIColor(red: CGFloat(redValue),
//                                       green: CGFloat(greenValue),
//                                       blue: CGFloat(blueValue),
//                                       alpha: 1)
//    }
////    func setViewColor(with color: ViewColor) {
////        self.color = color
////        view.backgroundColor = UIColor(red: CGFloat(color.redValue),
////                                       green: CGFloat(color.greenValue),
////                                       blue: CGFloat(color.blueValue),
////                                       alpha: 1)
////    }
//}
