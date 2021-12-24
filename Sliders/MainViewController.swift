//
//  MainViewController.swift
//  Sliders
//
//  Created by Сашок on 24.12.2021.
//

import UIKit

protocol ColorViewControllerDelagate {
    func updateBackgroundColor(with color: UIColor)
}

class MainViewController: UIViewController, ColorViewControllerDelagate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorViewController = segue.destination as? ColorViewController else { return }
        
        colorViewController.delegate = self
        colorViewController.color = view.backgroundColor ?? .white
    }
    
    func updateBackgroundColor(with color: UIColor) {
        view.backgroundColor = color
    }

}
