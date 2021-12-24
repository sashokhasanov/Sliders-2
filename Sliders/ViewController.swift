//
//  ViewController.swift
//  Sliders
//
//  Created by Сашок on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
    }
    
    override func viewWillLayoutSubviews() {
        updateLabelsText(for: redValueLabel, greenValueLabel, blueValueLabel)
        updateColorView()
    }

    @IBAction func sliderMoved(_ sender: UISlider) {
        switch sender {
        case redSlider:
            updateLabelsText(for: redValueLabel)
        case greenSlider:
            updateLabelsText(for: greenValueLabel)
        case blueSlider:
            updateLabelsText(for: blueValueLabel)
        default:
            break
        }
        
        updateColorView()
    }
    
    private func updateLabelsText(for labels: UILabel...) {
        
        labels.forEach() { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = getColorText(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = getColorText(from: greenSlider)
            case blueValueLabel:
                blueValueLabel.text = getColorText(from: blueSlider)
            default:
                break
            }
        }
    }

    private func updateColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: CGFloat(1.0))
    }
    
    private func getColorText(from slider: UISlider) ->String {
        String(format: "%.2f", slider.value)
    }
}
