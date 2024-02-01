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
    var delegate: SettingsViewControllerDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = colorView.frame.height/5
        colorView.backgroundColor = currentColor
        setSlidersValue()
        setupLabels()
        setupTextFields()
    }

    // MARK: - IBActions
    ///IDelegate color to main View. If has mistake than return white color
    @IBAction func doneButtonTapped() {
        delegate.setViewColor(with: colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    ///When the slider moves, the color in ColorView, value in textField and text in label change
    @IBAction func sliderActions(_ sender: UISlider) {
        setupColorView()
        setupLabels()
        setupTextFields()
    }
    // MARK: - Private methods
    ///Paint colorView depends from sliders' values
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
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    /// Sets text in text fields depends from sliders' values
    private func setupTextFields() {
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
    }
    
    ///Formatted UISlider to String with two sign after  dot
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    
    ///Set sliders value(red, green, blue) depends from color in ColorView
    private func setSlidersValue() {
        let color = CIColor(color: currentColor)
        
        redSlider.value = Float(color.red)
        greenSlider.value = Float(color.green)
        blueSlider.value = Float(color.blue)
        }
    }
