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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliders()
        setupLabels()
        setupView()
        
    }

    // MARK: - IBActions
    @IBAction func RedSliderAction() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
        redLabel.text = String(format: "%.2f",redSlider.value)
        
    }
    @IBAction func GreenSliderAction() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
        greenLabel.text = String(format: "%.2f",greenSlider.value)
    }
    
    @IBAction func BlueSliderAction() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
        blueLabel.text = String(format: "%.2f",blueSlider.value)
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
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }

    private func setupView() {
        colorView.layer.cornerRadius = colorView.frame.height/5
    }
}

