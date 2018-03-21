//
//  CalculatorViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    // BEGIN-UOC-7.1
    @IBOutlet weak var initialAmountLabel: UILabel!
    @IBOutlet weak var interestRateLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var finalAmountLabel: UILabel!
    @IBOutlet weak var initialAmountSlider: UISlider!
    @IBOutlet weak var interestRateStepper: UIStepper!
    @IBOutlet weak var yearsStepper: UIStepper!
    // END-UOC-7.1
    
    
    // BEGIN-UOC-7.2
    // IBAction para el slider. Detecta la acción del usuario sobre el slider y permite calcular la cantidad correspondiente a dicho movimiento
    @IBAction func sliderAction(_ sender: Any) {
        initialAmountLabel.text = "Initial amount:" + String(format: "%.0f", initialAmountSlider.value) + "€"
        calcFinalAmount()
    }
    // IBAction para el stepper del interés que introduce el usuario.
    @IBAction func stepperAction(_ sender: Any) {
        interestRateLabel.text = "Interest rate:" + String(format: "%.2f", interestRateStepper.value)+" %"
        calcFinalAmount()
    }
    // IBAction para el stepper de los años que introduce el usuario
    @IBAction func yearsAction(_ sender: Any) {
        yearsLabel.text = "Years:" + String(format:"%.0f", yearsStepper.value)
        calcFinalAmount()
    }
    
    // Función calcFinalAmount() que llama a la función Services.calculateFinalAmount cada vez que se añade un nuevo dato en el slider o los steppers
    func calcFinalAmount(){
        let amount = initialAmountSlider.value
        let interest = interestRateStepper.value / 100
        let years = yearsStepper.value
        finalAmountLabel.text = String(format: "%.2f", Services.calculateFinalAmount(ForAmount: amount, WithInterest: interest, AndYears: years))
    }
    // END-UOC-7.2
    
    // BEGIN-UOC-7.3
    // Establecimiento de los valores iniciales y el resultado asociado
    override func viewDidLoad() {
        initialAmountSlider.value = 100
        initialAmountLabel.text = "Initial amount:" + String(format: "%.0f", initialAmountSlider.value) + "€"
        interestRateStepper.value = 1
        interestRateLabel.text = "Interest rate:" + String(format: "%.2f", interestRateStepper.value)+" %"
        yearsStepper.value = 1
        yearsLabel.text = "Years:" + String(format:"%.0f", yearsStepper.value)
        
        calcFinalAmount()
    }
    // END-UOC-7.3
}
