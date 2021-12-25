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
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    var delegate: ColorViewControllerDelagate!
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        updateSliders(redSlider, greenSlider, blueSlider)
        updateLabels(redValueLabel, greenValueLabel, blueValueLabel)
        updateTextFields(redTextField, greenTextField, blueTextField)
        updateColorView()
    }

    @IBAction func sliderMoved(_ sender: UISlider) {
        
        updateModel()
        
        switch sender {
        case redSlider:
            updateLabels(redValueLabel)
            updateTextFields(redTextField)
        case greenSlider:
            updateLabels(greenValueLabel)
            updateTextFields(greenTextField)
        case blueSlider:
            updateLabels(blueValueLabel)
            updateTextFields(blueTextField)
        default:
            break
        }

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
    
    private func updateTextFields(_ textFields: UITextField...) {
        guard !textFields.isEmpty else { return }
        
        let colorComponents = getRgbComponens(from: color)
        
        textFields.forEach() { textField in
            switch textField {
            case redTextField:
                redTextField.text = getColorText(from: colorComponents.red)
            case greenTextField:
                greenTextField.text = getColorText(from: colorComponents.green)
            case blueTextField:
                blueTextField.text = getColorText(from: colorComponents.blue)
            default:
                break
            }
        }
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

extension ColorViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        updateModel2()
        updateSliders(redSlider, greenSlider, blueSlider)
        updateLabels(redValueLabel, greenValueLabel, blueValueLabel)
        updateColorView()
    }
    
    
    private func getNumberFromTextField(_ textField: UITextField) -> Float? {
        Float(textField.text ?? "")
    }
    
    private func updateModel2() {
        color = UIColor(red: CGFloat(getNumberFromTextField(redTextField) ?? 0),
                        green: CGFloat(getNumberFromTextField(greenTextField) ?? 0),
                        blue: CGFloat(getNumberFromTextField(blueTextField) ?? 0),
                        alpha: CGFloat(1.0))
    }
}
