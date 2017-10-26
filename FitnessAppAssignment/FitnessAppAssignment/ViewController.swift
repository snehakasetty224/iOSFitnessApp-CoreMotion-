//
//  ViewController.swift
//  FitnessAppAssignment
//
//  Created by Sneha Kasetty Sudarshan on 10/7/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var numberOfSteps:Int! = nil
    var distance:Double! = nil
    var floorsAscend:Int! = nil
    var floorsDescend:Int! = nil
    
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var floorAscendedLabel: UILabel!
    @IBOutlet weak var floorsDescendedLabel: UILabel!
    
    
    //
    var pedometer = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func beginWorkout(_ sender: Any) {
        
        pedometer = CMPedometer()
        
        pedometer.startUpdates(from: Date(), withHandler: { (pedometerData, error)
            in
            if let pedData = pedometerData{
                self.numberOfSteps = Int(pedData.numberOfSteps)
                self.stepsLabel.text = String(format:" %i",self.numberOfSteps)
                if let distance = pedData.distance{
                          self.distance = Double(distance)
                                       self.distanceLabel.text = String(format:"%02.02f mi",self.distance)
                                }
                if let floorsAcenda = pedData.floorsAscended{
                    self.floorsAscend = Int(floorsAcenda)
                                       self.floorAscendedLabel.text = String(format:"%i",self.floorsAscend)
                                    }
                if let floorsDescenda = pedData.floorsDescended{
                    self.floorsDescend = Int(floorsDescenda)
                                          self.floorsDescendedLabel.text = String(format:"%i",self.floorsDescend)
                }
            } else {
                self.numberOfSteps = nil
            }
        })
        
         //displayPedometerData()
    }
    
    @IBAction func EndWorkout(_ sender: Any) {
       
        
        self.stepsLabel.text = "0"
        self.floorAscendedLabel.text = "0"
        self.floorsDescendedLabel.text = "0"
        self.distanceLabel.text = "0"
        pedometer = CMPedometer()
        pedometer.stopUpdates()
    }
    

    
}

