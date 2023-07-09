//
//  ViewController.swift
//  Home Work Three
//
//  Created by Владислав Клунный on 09.07.2023.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var labelToRedSlider: UILabel!
    @IBOutlet var labelToGreenSlider: UILabel!
    @IBOutlet var labelToBlueSlider: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 15
        setupSliderView()
        setupLabel()
        sliderAction()
        
    }

    @IBAction func sliderAction() {
        setupSliderView()
        setupLabel()
        
    }
    /// MARK: Private func setup
    
    private func setupSliderView() {
        
        mainView.backgroundColor = UIColor(
            red:  CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat( blueSlider.value),
            alpha: 1
        )
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func setupLabel() {
        labelToRedSlider.text = String(format: "%.2f", redSlider.value)
        labelToGreenSlider.text = String(format: "%.2f", greenSlider.value)
        labelToBlueSlider.text = String(format: "%.2f", blueSlider.value)
    }
    
}

