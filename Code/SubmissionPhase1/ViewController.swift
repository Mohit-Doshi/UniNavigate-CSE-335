//
//  ViewController.swift
//  SubmissionPhase1
//
//  Created by Mohit.
//  Copyright © 2018 Mohit D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CoursesView: UITextView!
    
    var jsonResult:NSDictionary?
    var obj:BuildingsApiCall?  // object to communicate with Model
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        obj = BuildingsApiCall() //initializing object
        obj!.loadbuildingsdata() // calling function to load JSON data in model
        var clr:UIColor = UIColor.black
        CoursesView.layer.borderColor = clr.cgColor // an attempt to give the CoursesView UITextView a black border
        CoursesView.isEditable = false              // setting this to false so that the user cannot edit the content inside
        var tobj:CourseInfoModel = CourseInfoModel()
        var x:String = "Courses being tracked:-\n"
        x.append(tobj.stringofrecords())            // x now contains whatever stringofrecords() returns
        CoursesView.text = x
        CoursesView.flashScrollIndicators()         // temporarily flashes the scroll bars (if any) upon startup
    }
    
    override func viewDidAppear(_ animated: Bool) { // refreshes the CoursesView UITextView each time the user arrives to this view of the app
        super.viewDidAppear(animated)
        var tobj:CourseInfoModel = CourseInfoModel()
        var x:String = "Courses being tracked:-\n"
        x.append(tobj.stringofrecords())
        CoursesView.text = x
        CoursesView.flashScrollIndicators()
    }
    

    @IBAction func START_Button(_ sender: UIButton)
    {
        jsonResult = obj!.getJSON() // stores returned JSON data in jsonResult
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        let des = segue.destination as! ListOfBuildingsViewController
        des.jsonfromviewctrl = jsonResult   // sends the entire JSON object to the next View Controller
            
    }   //end of prepare
    
}

