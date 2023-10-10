//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Irina Muravyeva on 27.09.2023.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    var currentColor: ViewColor!
    var delegate: ViewControllerDelegate!
    
//    guard let navigationVC = segue.destination as? UINavigationController else { return}
//    guard let startVC = navigationVC.topViewController as? StartViewController else { return }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = colorView.frame.height/5
        setupColorView()
        setupLabels()
    }

    // MARK: - IBActions
    @IBAction func DoneButtonTapped() {
        delegate.setViewColor(withRed: redSlider.value,
                              green: greenSlider.value,
                              blue: blueSlider.value)
        dismiss(animated: true)
    }
    
    @IBAction func sliderActions(_ sender: UISlider) {
        setupColorView()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: sender)
        case greenSlider:
            greenLabel.text = string(from: sender)
        default :
            blueLabel.text = string(from: sender)
        }
    }
    // MARK: - Private methods
    
    private func setupColorView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setupLabels() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

