//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Irina Muravyeva on 09.10.2023.
//

import UIKit

protocol ViewControllerDelegate {
    func setViewColor(withRed: Float, green: Float, blue: Float)
}
class StartViewController: UIViewController {

    var currentColor: ViewColor!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewVC = segue.destination as? ViewController else { return}
        viewVC.currentColor = currentColor
        viewVC.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - ViewControllerDelegate
extension StartViewController: ViewControllerDelegate {
    func setViewColor(withRed redValue: Float, green greenValue: Float, blue blueValue: Float) {
        view.backgroundColor = UIColor(red: CGFloat(redValue),
                                       green: CGFloat(greenValue),
                                       blue: CGFloat(blueValue),
                                       alpha: 1)
    }
}
