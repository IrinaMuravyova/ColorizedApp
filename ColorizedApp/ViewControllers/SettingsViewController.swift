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
    
    var currentColor: UIColor!
//    var delegate: SettingsViewControllerDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = colorView.frame.height/5
        colorView.backgroundColor = currentColor
        setSlidersValue()
        setupLabels()
        setupTextFields()
//        setupColorView()
//        activateDelegate()
    }

    // MARK: - IBActions
    @IBAction func doneButtonTapped() {
//        setupSliders()
//        setupLabels()
        view.endEditing(true)
        
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
    
    ///
    @IBAction func sliderActions(_ sender: UISlider) {
        setupColorView()
        setupLabels()
        setupTextFields()
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
    
    ///Sets text in labels depends from sliders' values.
    private func setupLabels() {
        redLabel.text = String(format: "%.2f",redSlider.value)
        greenLabel.text = String(format: "%.2f",greenSlider.value)
        blueLabel.text = String(format: "%.2f",blueSlider.value)
    }
    /// Sets text in text fields depends from sliders' values
    private func setupTextFields() {
        redTextField.text = String(format: "%.2f",redSlider.value)
        greenTextField.text = String(format: "%.2f",greenSlider.value)
        blueTextField.text = String(format: "%.2f",blueSlider.value)
    }
    
//    private func string(from slider: UISlider) -> String {
//        String(format: "%.2f", slider.value)
//    }
    
//    private func activateDelegate() {
//        redTextField.delegate = self
//        greenTextField.delegate = self
//        blueTextField.delegate = self
//    }
    
    ///Set sliders value(red, green, blue) depends from color in ColorView
    private func setSlidersValue() {
        let color = CIColor(color: currentColor)
        
        redSlider.value = Float(color.red)
        greenSlider.value = Float(color.green)
        blueSlider.value = Float(color.blue)
        }
    }


// MARK: - UITextFieldDelegate
//extension SettingsViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        guard let newValue = textField.text else { return }
////        guard let numberValue = Float(newValue) else { return }
//        let numberValue = (textField.text as? NSString)?.floatValue ?? 0
//        if textField == redTextField {
//            currentColor.redValue = numberValue
//        } else if textField == greenTextField {
//            currentColor.greenValue = numberValue
//        } else if textField == blueTextField {
//            currentColor.blueValue = numberValue
//        }
////        setupLabels()
////        setupColorView()
//    }
//    
////    func textFieldShouldReturn(textField: UITextField) -> Bool {
////     doneButtonTapped()
////        return true
////    }
//}
