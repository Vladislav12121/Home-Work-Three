//
//  SettingsViewController.swift
//  Home Work Three
//
//  Created by Владислав Клунный on 09.07.2023.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(_ color: UIColor)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var labelToRedSlider: UILabel!
    @IBOutlet var labelToGreenSlider: UILabel!
    @IBOutlet var labelToBlueSlider: UILabel!
    
    var delegate: SettingsViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 15
        mainView.backgroundColor = viewColor
        setValue(for: redSlider, greenSlider, blueSlider)
        setupLabel()
        setupSliderView()
      
    }
    
    ///MARK: IBAction func
    @IBAction func sliderAction(_ sender: UISlider) {
        setupSliderView()
        setupLabel()
    }
    
    @IBAction func doneButton() {
        delegate.setNewColor(mainView.backgroundColor ?? .gray)
        dismiss(animated: true)
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
    }
    
    private func setupLabel() {
        labelToRedSlider.text = string(from: redSlider)
        labelToGreenSlider.text = string(from: greenSlider)
        labelToBlueSlider.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: viewColor)
        colorSliders.forEach { slder in
            switch slder {
            case redSlider: redSlider.value = Float(ciColor.red)
            case greenSlider: greenSlider.value = Float(ciColor.green)
            default: blueSlider.value = Float(ciColor.blue)
            }
        }
    }
}
