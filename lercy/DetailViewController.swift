//
//  DetailViewController.swift
//  lercy
//
//  Created by Allison Mcentire on 5/25/17.
//  Copyright © 2017 com.millionacrenest. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class DetailViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var dayAndTime1Label: UILabel!

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var dayAndTime2Label: UILabel!
    
    
    @IBOutlet weak var locationDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var hoursWorkedLabel: UILabel!
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = "Position: \(detail.latitude) + \(detail.longitude)"
            }
            if let label2 = dayAndTime1Label {
                label2.text = "Clock in: \(detail.timestamp!)"
            }
            if let label3 = locationDescriptionLabel {
                label3.text = "Position: \(detail.latitude2) + \(detail.longitude2)"
            }
//            if let label4 = dayAndTime2Label {
//                label4.text = "Clock out: \(detail.timestamp2!)"
//            }
            
            let hoursWorked = Date().timeIntervalSince(detail.timestamp as! Date)
                let (h,m,s) = secondsToHoursMinutesSeconds(seconds: Int(hoursWorked))
            if let label5 = hoursWorkedLabel {
                label5.text = "Hours Worked: \(h) Hours, \(m) Minutes, \(s) Seconds"
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
       
     
       
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    

   
    
    @IBAction func clockOutButtonPressed(_ sender: Any) {
        var event: Event!
        event.timestamp2 = NSDate()
        
        
  
        
        
        
        
        
    }
}

