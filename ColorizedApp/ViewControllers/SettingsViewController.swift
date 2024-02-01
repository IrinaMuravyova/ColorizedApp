//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Irina Muravyeva on 27.09.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
//    var currentColor: ViewColor!
//    var viewColor: UIColor!
    var currentColor: UIColor!
    var delegate: SettingsViewControllerDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = colorView.frame.height/5
        colorView.backgroundColor = viewColor
        setupColorView()
        setupLabels()
        setupTextFields()
        activateDelegate()
    }

    // MARK: - IBActions
    @IBAction func doneButtonTapped() {
//        setupSliders()
//        setupLabels()
        view.endEditing(true)
        delegate.setViewColor(withRed: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
//        guard let color = currentColor else { return }
//        delegate.setViewColor(with: color)
//        delegate.setViewColor(withRed: redSlider.value,
//                              green: greenSlider.value,
//                              blue: blueSlider.value)
//        delegate.setViewColor(withRed: (redTextField.text as? NSString)?.floatValue ?? 0,
//                              green: (greenTextField.text as? NSString)?.floatValue ?? 0,
//                              blue: (blueTextField.text as? NSString)?.floatValue ?? 0)
        dismiss(animated: true)
    }
    
    @IBAction func sliderActions(_ sender: UISlider) {
        setupColorView()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: sender)
            redTextField.text = string(from: sender)
        case greenSlider:
            greenLabel.text = string(from: sender)
            greenTextField.text = string(from: sender)
        default :
            blueLabel.text = string(from: sender)
            blueTextField.text = string(from: sender)
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
    
    private func setupTextFields() {
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func activateDelegate() {
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    private func setSlidersValue() {
        let setupColor = CIColor(color: viewColor)
        redSlider.value = Float(setupColor.red)
        greenSlider.value = Float(setupColor.green)
        blueSlider.value = Float(setupColor.blue)
//        colorSliders.forEach { slider in
//            switch slider {
//            case redSlider: redSlider.value = Float(ciColor.red)
//            case greenSlider: greenSlider.value = Float(ciColor.green)
//            default: blueSlider.value = Float(ciColor.blue)
//            }
        }
    }


// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
//        guard let numberValue = Float(newValue) else { return }
        let numberValue = (textField.text as? NSString)?.floatValue ?? 0
        if textField == redTextField {
            currentColor.redValue = numberValue
        } else if textField == greenTextField {
            currentColor.greenValue = numberValue
        } else if textField == blueTextField {
            currentColor.blueValue = numberValue
        }
//        setupLabels()
//        setupColorView()
    }
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//     doneButtonTapped()
//        return true
//    }
}
