//
//  ViewController.swift
//  Sliders
//
//  Created by Сашок on 10.12.2021.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var delegate: ColorViewControllerDelagate!
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        updateSliders(redSlider, greenSlider, blueSlider)
        updateLabels(redValueLabel, greenValueLabel, blueValueLabel)
        updateColorView()
    }

    @IBAction func sliderMoved(_ sender: UISlider) {
        switch sender {
        case redSlider:
            updateLabels(redValueLabel)
        case greenSlider:
            updateLabels(greenValueLabel)
        case blueSlider:
            updateLabels(blueValueLabel)
        default:
            break
        }

        updateModel()
        updateColorView()
    }
    
    @IBAction func DoneButtonPressed() {
        if let delegate = delegate, let color = colorView.backgroundColor {
            delegate.updateBackgroundColor(with: color)
        }
        
        dismiss(animated: true)
    }
    
    private func updateLabels(_ labels: UILabel...) {

        guard !labels.isEmpty else { return }
        
        let colorComponents = getRgbComponens(from: color)
        
        labels.forEach() { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = getColorText(from: colorComponents.red)
            case greenValueLabel:
                greenValueLabel.text = getColorText(from: colorComponents.green)
            case blueValueLabel:
                blueValueLabel.text = getColorText(from: colorComponents.blue)
            default:
                break
            }
        }
    }
    
    private func updateSliders(_ sliders: UISlider...) {
        let colorComponenst = getRgbComponens(from: color)
        
        redSlider.value = Float(colorComponenst.red)
        greenSlider.value = Float(colorComponenst.green)
        blueSlider.value = Float(colorComponenst.blue)
    }

    private func updateColorView() {
        colorView.backgroundColor = color
    }
    
    private func updateModel() {
        color = UIColor(red: CGFloat(redSlider.value),
                        green: CGFloat(greenSlider.value),
                        blue: CGFloat(blueSlider.value),
                        alpha: CGFloat(1.0))
    }
    
    private func getColorText(from value: CGFloat) -> String {
        String(format: "%.2f", value)
    }
    
    private func getRgbComponens(from color: UIColor) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        color.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        return (red, green, blue)
    }
}
