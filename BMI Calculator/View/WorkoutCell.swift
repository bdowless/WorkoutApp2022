//
//  WorkoutCell.swift
//  BMI Calculator
//
//  Created by Brandon Dowless on 2/27/22.
//

import Foundation
import UIKit

protocol workoutCellDelegate: class {
    func handleExcersiseTapped(cell: WorkoutCell)
}

class WorkoutCell: UITableViewCell {
    
    //MARK: - Properties
    
   weak var delegate: workoutCellDelegate?
    
    var workout: Workout? {
        didSet {
            configureUI()
        }
    }
    
    private var workoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hamstring", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        return button
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBlue
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    @objc func handleButtonTapped(sender: UIButton ) {
        delegate?.handleExcersiseTapped(cell: self)
        print("DEBUG: The button has been tapped \(sender.titleLabel)")
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        self.addSubview(workoutButton)
        workoutButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 42) .isActive = true
        workoutButton.centerYAnchor.constraint(equalTo: centerYAnchor) .isActive = true
        
        self.layer.cornerRadius = 5
        
        
        workoutButton.setTitle(workout?.title, for: .normal)
        
    }

}
