//
//  StatisticsViewController.swift
//  SFUnwind
//
//  Created by berke on 2017-03-27.
//  Copyright © 2017 CMPT 276 - Group 5. All rights reserved.
//

import UIKit



class StatisticsViewController: UIViewController {

    
    var shortestSession: Double = 999
    var averageTime: Double = 0
    var longestSession: Double = 0
    var totalNumber = 0
    
    var allViews = [UIView]()

    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets corner radius of back button
        self.backButton.layer.cornerRadius = 10
        
        if let avg:Double = UserDefaults.standard.value(forKey: "averageSession") as! Double?{
            averageTime = avg
        }
        if let minS:Double = UserDefaults.standard.value(forKey: "minSession") as! Double? {
            shortestSession = minS
        }
        if let maxS:Double = UserDefaults.standard.value(forKey: "maxSession") as! Double?{
            longestSession = maxS
        }
        if let totalS = UserDefaults.standard.value(forKey: "totalSessions") as! Int?{
            totalNumber = totalS
        }
        UserDefaults.standard.synchronize()
        
        if(shortestSession != 999){
            averageTime = (round(100*averageTime)/100)
            averageTimeLabel.text = String(averageTime) + " Seconds"
            shortestSessionLabel.text = String(shortestSession) + " Seconds"
            longestSessionLabel.text = String(longestSession) + " Seconds"
            totalNumberOfSessionsLabel.text = String(totalNumber)
        }
        else {
            averageTimeLabel.text = "N/A"
            shortestSessionLabel.text = "N/A"
            longestSessionLabel.text = "N/A"
            totalNumberOfSessionsLabel.text = "0"
        }
        
        
        if(shortestSession == 999){
        shortestSessionLabel.text = "N/A"
        }
        
        if(longestSession > 300){
        longestSessionLabel.text = "300 Seconds"
        }
        
        //let board = Draw(frame: CGRect(x: 25, y: 240, width: 250, height: 300))
        
        //board.draw(CGRect(
            //origin: CGPoint(x: 50, y: 50),
            //size: CGSize(width: 100, height: 100)));
        //self.view.addSubview(board)
        
        let bottomG = UIScreen.main.bounds.height * (9/10)
        let heightMax = UIScreen.main.bounds.height * (4/10)
        let leftG = UIScreen.main.bounds.width * (1/10)
        let spacer = UIScreen.main.bounds.width * (8/100)
        var offset = 0
        if let previousSessions = UserDefaults.standard.value(forKey: "previousSessions") as? [Double] {
            for bar in previousSessions {
                self.allViews.append(UIView())
                self.allViews.append(UIView())
                self.allViews[offset*2].backgroundColor = UIColor.cyan
                self.allViews[(offset*2) + 1].backgroundColor = UIColor.cyan
                self.allViews[offset*2].frame = CGRect(x: (leftG + (spacer*CGFloat(offset))), y: bottomG, width: spacer-5, height: -((CGFloat(bar/300.0)*heightMax)))
                self.allViews[(offset*2) + 1].frame = CGRect(x: (leftG + (spacer*CGFloat(offset))), y: bottomG, width: spacer-5, height: -(heightMax))
                self.allViews[(offset*2) + 1].alpha = 0.3
                self.view.addSubview(self.allViews[(offset*2) + 1])
                self.view.addSubview(self.allViews[offset*2])
                self.view.bringSubview(toFront: self.allViews[(offset*2) + 1])
                self.view.bringSubview(toFront: self.allViews[offset*2])
                offset = offset + 1
            }
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    func loadTotalStatistics() -> String{
        let fileName = "timeStatistics"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension(".txt")
        
        
        var readString = "" // Used to store the file contents
        do {
            // Read the file contents
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        return readString
        
    }
    @IBAction func closeScreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


    @IBOutlet weak var totalNumberOfSessionsLabel: UILabel!
    @IBOutlet weak var longestSessionLabel: UILabel!
    @IBOutlet weak var shortestSessionLabel: UILabel!
    @IBOutlet weak var averageTimeLabel: UILabel!
}





