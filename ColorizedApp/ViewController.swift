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
    
    let opaque = 1.0
    var redValue: CGFloat = 0.0
    var greenValue: CGFloat = 0.0
    var blueValue: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSliders()
        setupLabels()
        setupView()
        
        redValue = CGFloat(redSlider.value)
        greenValue = CGFloat(greenSlider.value)
        blueValue = CGFloat(blueSlider.value)
        
        
        
    }

    // MARK: - IBActions
    @IBAction func RedSliderAction() {
        redValue = CGFloat(redSlider.value)
        colorView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: opaque)
        redLabel.text = String(format: "%.2f", redValue)
        
    }
    @IBAction func GreenSliderAction() {
        greenValue = CGFloat(greenSlider.value)
        colorView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: opaque)
        greenLabel.text = String(format: "%.2f", greenValue)
    }
    
    @IBAction func BlueSliderAction() {
        blueValue = CGFloat(blueSlider.value)
        colorView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: opaque)
        blueLabel.text = String(format: "%.2f", blueValue)
    }
    
    // MARK: - Private methods
    
    private func setupSliders() {
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = .gray
        redSlider.thumbTintColor = .red
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = 0.5
        
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .gray
        greenSlider.thumbTintColor = .green
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = 0.3
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .gray
        blueSlider.thumbTintColor = .blue
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = 0.4
    }
    
    private func setupLabels() {
        redLabel.text = String(format: "%.2f", redValue)
        greenLabel.text = String(format: "%.2f", greenValue)
        blueLabel.text = String(format: "%.2f", blueValue)
    }

    private func setupView() {
        colorView.layer.cornerRadius = colorView.frame.height/5
    }
}

