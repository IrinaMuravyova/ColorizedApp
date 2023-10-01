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
        
        setupSliders(forSlider: redSlider, value: 0.5, color: .red)
        setupSliders(forSlider: greenSlider, value: 0.3, color: .green)
        setupSliders(forSlider: blueSlider, value: 0.4, color: .blue)
        
        setupColorView()
        setupLabels()
        setupView()
    }

    // MARK: - IBActions
    
    @IBAction func setupColorView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: opaque
        )
        setupLabels()
    }
    
    // MARK: - Private methods
    
    private func setupSliders(forSlider: UISlider,
                              value: Float,
                              color: UIColor) {
        
        forSlider.minimumTrackTintColor = color
        forSlider.maximumTrackTintColor = .gray
        forSlider.thumbTintColor = color
        forSlider.minimumValue = 0
        forSlider.maximumValue = 1
        forSlider.value = value
    }
    
    private func setupLabels() {
        redLabel.text = String(format: "%.2f",
                               CGFloat(redSlider.value))
        greenLabel.text = String(format: "%.2f",
                                 CGFloat(greenSlider.value))
        blueLabel.text = String(format: "%.2f",
                                CGFloat(blueSlider.value))
    }

    private func setupView() {
        colorView.layer.cornerRadius = colorView.frame.height/5
    }
}

