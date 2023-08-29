//
//  MainViewController.swift
//  Home Work Three
//
//  Created by Владислав Клунный on 21.08.2023.
//

import UIKit


class MainViewController: UIViewController {
    
    var color = UIColor.gray
    
    var delegate: SettingsViewControllerDelegate!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainVC = segue.destination as? SettingsViewController else { return }
        mainVC.delegate = self
        mainVC.viewColor = view.backgroundColor
    }
    
    @IBAction func showSettings(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showSettings", sender: nil)
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}
