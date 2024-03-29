//
//  SettingsViewController.swift
//  ColorPaletteApp
//
//  Created by Sunni Tang on 8/20/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    var delegate: ColorChangeable?
    
    var selectedColor: UIColor?
    
    var redValue: CGFloat = 0.5
    var greenValue: CGFloat = 0.5
    var blueValue: CGFloat = 0.5
    var alphaValue: CGFloat = 0.5
    
    var newColor: UIColor! {
        didSet {
            delegate?.changeColor(to: newColor)
            updateBKGDColor()
            updateSliderValues()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newColor = selectedColor
        newColor.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue)
        updateBKGDColor()
        updateSliderValues()

    }
    @IBAction func sliderChangeColorValue(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redValue = CGFloat(sender.value)
        case 1:
            greenValue = CGFloat(sender.value)
        case 2:
            blueValue = CGFloat(sender.value)
        case 3:
            alphaValue = CGFloat(sender.value)
        default:
            fatalError()
        }
        
        updateColor()
    }
    

    func updateColor(){
        newColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }
    
    
    func updateBKGDColor() {
        if let newColor = newColor {
            view.backgroundColor = newColor
        }
    }
        
    func updateSliderValues() {
            redSlider.value = Float(redValue)
            greenSlider.value = Float(greenValue)
            blueSlider.value = Float(blueValue)
            alphaSlider.value = Float(alphaValue)
    }
    
    
}

