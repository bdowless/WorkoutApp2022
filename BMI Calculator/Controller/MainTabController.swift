//
//  WorkoutController.swift
//  BMI Calculator
//
//  Created by Brandon Dowless on 2/27/22.
//

import UIKit

class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        configureUI()
    }
    
    //MARK: Helpers
    
    func configureUI() {
        let home = HomeController()
        home.tabBarItem.image = UIImage(systemName: "house")
        
        let main = UINavigationController(rootViewController: WorkoutController())
        main.tabBarItem.image = UIImage(systemName: "house")
        
        
        viewControllers = [ main, home]
       
    }
}



