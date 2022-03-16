//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        resultOfQuiz()
    }
    
    private func resultOfQuiz () {
        let animals = answersChosen.map { $0.animal }
        
        var dogsPoints = 0
        var catsPoints = 0
        var rabbitsPoints = 0
        var turtlesPoints = 0
        
        for animal in animals {
            switch animal {
            case .dog:
                dogsPoints += 1
            case .cat:
                catsPoints += 1
            case .rabbit:
                rabbitsPoints += 1
            case .turtle:
                turtlesPoints += 1
            }
        }
        
        let animalsPoints = [dogsPoints, catsPoints, rabbitsPoints, turtlesPoints].sorted(by: >).first
        
        switch animalsPoints {
        case dogsPoints:
            resultLabel.text = "Вы - \(Animal.dog.rawValue)"
            definitionLabel.text = "\(Animal.dog.definition)"
        case catsPoints:
            resultLabel.text = "Вы - \(Animal.cat.rawValue)"
            definitionLabel.text = "\(Animal.cat.definition)"
        case rabbitsPoints:
            resultLabel.text = "Вы - \(Animal.rabbit.rawValue)"
            definitionLabel.text = "\(Animal.rabbit.definition)"
        case turtlesPoints:
            resultLabel.text = "Вы - \(Animal.turtle.rawValue)"
            definitionLabel.text = "\(Animal.turtle.definition)"
        default: break
        }
    }
}
