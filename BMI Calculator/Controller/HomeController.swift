//
//  HomeController.swift
//  BMI Calculator
//
//  Created by Brandon Dowless on 2/21/22.
//

import UIKit

class HomeController: UIViewController {
    
    //MARK: - Properties
    
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Rep Max Calculator"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weightSliderView: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 10
        slider.maximumValue = 350
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = .blue
        slider.addTarget(self, action: #selector(handleWeight), for: .touchUpInside)
        return slider
    }()
    
    var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight is 5"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repSliderView: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = .blue
        slider.addTarget(self, action: #selector(handleReps), for: .touchUpInside)
        return slider
    }()
    
    var repLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of reps 5"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var calculateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50) .isActive = true
        button.setTitle("Calculate", for: .normal)
        button.addTarget(self, action: #selector(handleResult), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc func handleWeight(sender: UISlider) {
        resultLabel.isHidden = true
        let weightlabel = weightLabel
        var value  = Int(sender.value)
        
        weightlabel.text = "Weight is \(value)"
        
    }
    
    @objc func handleReps(sender: UISlider) {
        resultLabel.isHidden = true
        let repLabel = repLabel
        var value =  Int(sender.value)
        
        repLabel.text = "Number of reps \(value) "
    }
    
    @objc func handleResult() {
        let repMaxCalculator = RepMaxCalculator()
        
        var result = repMaxCalculator.repMaxCalculation(repSliderValue: repSliderView.value, weightSliderValue: weightSliderView.value)
        print("DEBUG: \(result)")
        resultLabel.isHidden = false
        resultLabel.text = ("Your Rep Max is \(result) lbs")
        
        /*
         let textFieldStringValue = myTextField.text
         let intValue = Int(textFieldStringValue)
         
         */
    }

    
    //MARK: - Helpers
    
    func configureUI() {
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80) .isActive = true
        
        let stack = UIStackView(arrangedSubviews: [weightLabel, weightSliderView, repLabel, repSliderView,calculateButton, resultLabel])
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40) .isActive = true
        stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 150) .isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40) .isActive = true
    }
    
    func templateSlider() -> UISlider {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.backgroundColor = .systemRed
        return slider
    }
    
    func templateLabel(Text: String) -> UILabel {
        var label = UILabel()
        label.text = Text
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
