//
//  MainController.swift
//  BMI Calculator
//
//  Created by Brandon Dowless on 2/27/22.
//

import UIKit

class WorkoutController: UITableViewController {
    
    //MARK: - Properties
    
    var workouts = workoutsArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: Helpers
    
    func configureUI() {
        navigationItem.title = "Workouts"
        tableView.register(WorkoutCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension WorkoutController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WorkoutCell
        cell.workout = workouts[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}

extension WorkoutController: workoutCellDelegate {
    func handleExcersiseTapped(cell: WorkoutCell) {
        print("Hey the controller has been tapped \(cell)")
        let controller = ExcersiseController()
        controller.navigationController?.navigationBar.backgroundColor = .white
        let nav = UINavigationController(rootViewController: controller)
        controller.workout = cell.workout
        print("Hey the controller has been tapped \(cell)")
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    
    }
    
    
}

