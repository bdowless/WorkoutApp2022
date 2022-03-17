//
//  ExersiseCell.swift
//  BMI Calculator
//
//  Created by Brandon Dowless on 3/8/22.
//

import Foundation
import UIKit

class ExerciseCell: UITableViewCell {
    

    
    var exercise: Exercise? {
        didSet {
            print("DEBUG: Exersise has been set")
            configureUI()
        }
    }
    
    //MARK: - Properties
    
    var cellLabel: UILabel = {
        let label = UILabel()
        label.text = "HAMSTRINGS"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    var repLabel: UILabel = {
        let label = UILabel()
        label.text = "String(number)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBlue
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        addSubview(cellLabel)
        cellLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20) .isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: centerYAnchor) .isActive = true
        
        addSubview(repLabel)
        repLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20) .isActive = true
        repLabel.centerYAnchor.constraint(equalTo: centerYAnchor) .isActive = true
        
        guard let exercise = exercise else { return }
        
        cellLabel.text = exercise.title
        repLabel.text = "\(exercise.sets) x \(exercise.reps)"
    
        
        
    }
}
