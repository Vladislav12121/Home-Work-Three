//
//  SettingsViewController.swift
//  Home Work Three
//
//  Created by Владислав Клунный on 09.07.2023.
//

import UIKit

protocol ISettingsViewControllerDelegate {
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
    
    var delegate: ISettingsViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 15
        mainView.backgroundColor = viewColor
        setValue(for: redSlider, greenSlider, blueSlider)
        sliderAction()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
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
    }
    
    private func setupLabel() {
        labelToRedSlider.text = String(format: "%.2f", redSlider.value)
        labelToGreenSlider.text = String(format: "%.2f", greenSlider.value)
        labelToBlueSlider.text = String(format: "%.2f", blueSlider.value)
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
    
    ///MARK: IBAction func
    @IBAction func doneButton() {
        delegate.setNewColor(mainView.backgroundColor ?? .gray)
        dismiss(animated: true)
    }
}
