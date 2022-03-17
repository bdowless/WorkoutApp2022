//
//  WorkoutModel.swift
//  BMI Calculator
//
//  Created by Brandon Dowless on 2/27/22.
//

import Foundation

struct Workout {
    var title: String
    var exercises: [Exercise]
}

struct Exercise {
    var title: String
    var reps: Int
    var sets: Int
    var video: String
}

let workoutsArray = [
    Workout(title: "Back", exercises: [
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift")]),
    
    Workout(title: "Back", exercises: [
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift")]),

    Workout(title: "Back", exercises: [
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift")]),

    Workout(title: "Back", exercises: [
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift"),
    Exercise(title: "Pull Down", reps: 10, sets: 2, video: "https://bit.ly/swswift")])]
