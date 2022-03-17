//
//  ExcersiseController.swift
//  BMI Calculator
//
//  Created by Brandon Dowless on 2/27/22.
//

import Foundation
import UIKit

class ExcersiseController: UIViewController {
    
    //MARK: - Properties
    
    var exerciseVideoView: UIView = {
        let view = ExerciseVideo()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .red
        return tableView
    }()
    
    var workout: Workout? {
        didSet {
            print("DEBUG: Workout has been set")
        }
    }

    var workoutLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(ExerciseCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        configureUI()
        configureNav()
    }
    
    //MARK: - Selectors
    
    @objc func handleBackButton() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        
        view.addSubview(exerciseVideoView)
        exerciseVideoView.topAnchor.constraint(equalTo: view.topAnchor) .isActive = true
        exerciseVideoView.leftAnchor.constraint(equalTo: view.leftAnchor) .isActive = true
        exerciseVideoView.heightAnchor.constraint(equalToConstant: 400) .isActive = true
        exerciseVideoView.rightAnchor.constraint(equalTo: view.rightAnchor) .isActive = true
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: exerciseVideoView.bottomAnchor, constant: 20) .isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor) .isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor) .isActive = true
        
        view.addSubview(workoutLabel)
        workoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
        workoutLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80) .isActive = true

        navigationItem.title = workout?.title
    }
    
    func configureNav() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleBackButton))
    }
}



extension ExcersiseController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ExerciseCell
        cell.exercise = workout?.exercises[indexPath.row]
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let workout = workout else { return 0 }
        return workout.exercises.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let controller = ExerciseVideo (frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 300))
//        return controller
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 300
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exercise = workout?.exercises[indexPath.row]
        print("DEBUG: \(exercise?.title)")
        let controller = ExerciseVideo()
//        present(controller, animated: true, completion: nil)
        controller.exercise = exercise
        
        self.tableView.reloadData()
        
        
        
        
    }
}
