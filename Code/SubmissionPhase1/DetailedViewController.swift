//
//  DetailedViewController.swift
//  SubmissionPhase1
//
//  Created by Mohit.
//  Copyright © 2018 Mohit D. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    let picker = UIImagePickerController()
    var notes: [String] = []
    var crsenam:String?
    var ci:String?  // comes from ListOfClassesViewController
    var doescourseinfoexist:Bool?
    var obj:CourseInfoModel = CourseInfoModel()
    
    @IBOutlet weak var CourseField: UILabel!
    
    
    @IBOutlet weak var NotesView: UITextView!
    
    // the text fields are for users' notes and will be stored in core data once I find an appropriate data structure to configure them in
    
    
    @IBOutlet weak var segmentedpicker: UISegmentedControl!
    
    @IBOutlet var ImageView1: UIImageView! = UIImageView(image: UIImage(named: "noimg.png"))
    @IBOutlet var ImageView2: UIImageView! = UIImageView(image: UIImage(named: "noimg.png"))
    @IBOutlet var ImageView3: UIImageView! = UIImageView(image: UIImage(named: "noimg.png"))
    
    
    var imgin1:NSData?
    var imgin2:NSData?
    var imgin3:NSData?
    var whichimageview:[Int] = [0,0,0]
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        if crsenam != nil && crsenam != ""
        {
                CourseField.text = crsenam
            
                var tempobj:CourseInfoModel = CourseInfoModel()
                if(tempobj.doesCourseInfoExist(eyeDee: ci!) == true || doescourseinfoexist == true)
                {
                    let datum:CourseInfo = tempobj.getCourseInfoObject(eyeDee: ci!) // puts all the course information into the object - datum
                    CourseField.text = datum.courseName
                    notes = datum.notes!
                    if(notes.count > 0){
                        NotesView.text = notes[0]}
                    imgin1 = datum.image1
                    imgin2 = datum.image2
                    imgin3 = datum.image3
                    ImageView1.image = UIImage(data:datum.image1! as Data,scale:1.0)
                    ImageView2.image = UIImage(data:datum.image2! as Data,scale:1.0)
                    ImageView3.image = UIImage(data:datum.image3! as Data,scale:1.0)
                }
        }
    
   /*     if(obj.doesCourseInfoExist(eyeDee: ci!) == true || doescourseinfoexist == true)
        {
            print("HEY I'm here!")
            let datum:CourseInfo = obj.getCourseInfoObject(eyeDee: ci!) // puts all the course information into the object - datum
            CourseField.text = datum.courseName
            notes = datum.notes!
            if(notes.count > 0){
                NotesView.text = notes[0]}
            imgin1 = datum.image1
            imgin2 = datum.image2
            imgin3 = datum.image3
            ImageView1.image = UIImage(data:datum.image1! as Data,scale:1.0)
            ImageView2.image = UIImage(data:datum.image2! as Data,scale:1.0)
            ImageView3.image = UIImage(data:datum.image3! as Data,scale:1.0)
        }*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
       // whichimageview = [0,0,0]
        CourseField.font = UIFont(name: "Papyrus", size: 30)
        let nuimg:UIImage = UIImage(named: "noimg.png")!
        let noImageData = nuimg.pngData()
        imgin1 = noImageData as! NSData
        imgin2 = noImageData as! NSData
        imgin3 = noImageData as! NSData
        ImageView1.image = UIImage(data:noImageData!,scale:1.0)
        ImageView2.image = UIImage(data:noImageData!,scale:1.0)
        ImageView3.image = UIImage(data:noImageData!,scale:1.0)
        // Do any additional setup after loading the view.
        if(doescourseinfoexist == false)
        {
                let alertController = UIAlertController(title: "Course Name", message: "", preferredStyle: .alert)
                alertController.addTextField { (textField) in
                    textField.placeholder = "Enter the name of the course you take in this room"
                }
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    
                    print(alertController.textFields?.first?.text!)
                    self.crsenam = alertController.textFields?.first?.text!
                    if(self.crsenam == "" && alertController.textFields?.first?.text! == "")
                    {
                        self.performSegue(withIdentifier: "backfromdetailedVC", sender: self)
                    }
                    self.CourseField.text = self.crsenam
                    print("This is it \(self.CourseField.text)")
                    self.NotesView.text = "Add your notes here"
                    let image = UIImage(named: "noimg.png")
                    self.ImageView1 = UIImageView(image: image!)
                    self.ImageView2 = UIImageView(image: image!)
                    self.ImageView3 = UIImageView(image: image!)
                    
                } //end of OKAction
                
              //  let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            //}
                
                alertController.addAction(OKAction)
              //  alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true, completion: nil)
            
        }
        else        // the course already exists
        {
            let datum:CourseInfo = obj.getCourseInfoObject(eyeDee: ci!) // puts all the course information into the object - datum
            CourseField.text = datum.courseName
            notes = datum.notes!
            if(notes.count > 0){
                NotesView.text = notes[0]}
            imgin1 = datum.image1
            imgin2 = datum.image2
            imgin3 = datum.image3
            ImageView1.image = UIImage(data:datum.image1! as Data,scale:1.0)
            ImageView2.image = UIImage(data:datum.image2! as Data,scale:1.0)
            ImageView3.image = UIImage(data:datum.image3! as Data,scale:1.0)
        }
        
    }
    
    // to view previous notes
    @IBAction func PrevNotes(_ sender: UIButton)
    {
        if(notes.count > 0)
        {
            var match:Bool = false
            var matchindex:Int = 0
            var srch:String = NotesView.text!
            for i in 0..<notes.count
            {
                if notes[i] == srch
                {
                    match = true
                    matchindex = i
                    break
                }
            }
            if(match == false || srch == notes[0])
            {
                NotesView.text = notes[0]
            }
            else
            {
                NotesView.text = notes[matchindex-1]
            }
        }
    }
    
    // to view next notes
    @IBAction func NextNotes(_ sender: UIButton)
    {
        if(notes.count > 0)
        {
            var match:Bool = false
            var matchindex:Int = 0
            var srch:String = NotesView.text!
            for i in 0..<notes.count
            {
                if notes[i] == srch
                {
                    match = true
                    matchindex = i
                    break
                }
            }
            if(match == false)
            {
                NotesView.text = notes[0]
            }
            else
            {
                if(srch == notes[notes.count-1])
                {
                    NotesView.text = notes[notes.count-1]
                }
                else
                {
                    NotesView.text = notes[matchindex + 1]
                }
            }
        }
        
    }
    
    // adds user's notes to an array
    @IBAction func AddNotes(_ sender: UIButton)
    {
        let userinp:String = NotesView.text!
        var flag:Bool = true
        for i in 0..<notes.count    // to check for duplicates
        {
            if (userinp == "" || userinp == notes[i])
            {
                flag = false
                break
            }
        }
        if(flag == true)
        {
            notes.append(userinp)
            NotesView.text = ""
        }
    }
    
    // deletes user's notes from an array
    @IBAction func DeleteNotes(_ sender: UIButton)
    {
        let userinp:String = NotesView.text!
        var matchindex:Int = -1
        for i in 0..<notes.count
        {
            if notes[i] == userinp
            {
                matchindex = i
                break
            }
        }
        if(matchindex >= 0)
        {
            notes.remove(at: matchindex)
            if(notes.count == 0)
            {
                NotesView.text = ""
            }
            else if(matchindex >= notes.count || notes.count == 1)
            {
                NotesView.text = notes[0]
            }
            else if(notes.count > 0)
            {
                NotesView.text = notes[matchindex]
            }
        }
    }
    
    
    @IBAction func AddOrEditImg1(_ sender: UIButton)
    {
        whichimageview = [1,0,0]
        if self.segmentedpicker.selectedSegmentIndex == 0 // Camera
        {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.picker.allowsEditing = false
                self.picker.sourceType = UIImagePickerController.SourceType.camera
                self.picker.cameraCaptureMode = .photo
                self.picker.modalPresentationStyle = .fullScreen
                self.present(self.picker,animated: true,completion: nil)
            }
        }
        else        // Photo Library
        {
            self.picker.allowsEditing = false
            self.picker.sourceType = .photoLibrary
            self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.picker.modalPresentationStyle = .popover
            self.present(self.picker, animated: true, completion: nil)
        }
    }
    
    @IBAction func AddOrEditImg2(_ sender: UIButton)
    {
        whichimageview = [0,1,0]
        if self.segmentedpicker.selectedSegmentIndex == 0 // Camera
        {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.picker.allowsEditing = false
                self.picker.sourceType = UIImagePickerController.SourceType.camera
                self.picker.cameraCaptureMode = .photo
                self.picker.modalPresentationStyle = .fullScreen
                self.present(self.picker,animated: true,completion: nil)
            }
        }
        else        // Photo Library
        {
            self.picker.allowsEditing = false
            self.picker.sourceType = .photoLibrary
            self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.picker.modalPresentationStyle = .popover
            self.present(self.picker, animated: true, completion: nil)
        }
    }
    
    @IBAction func AddOrEditImg3(_ sender: UIButton)
    {
        whichimageview = [0,0,1]
        if self.segmentedpicker.selectedSegmentIndex == 0 // Camera
        {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.picker.allowsEditing = false
                self.picker.sourceType = UIImagePickerController.SourceType.camera
                self.picker.cameraCaptureMode = .photo
                self.picker.modalPresentationStyle = .fullScreen
                self.present(self.picker,animated: true,completion: nil)
            }
        }
        else        // Photo Library
        {
            self.picker.allowsEditing = false
            self.picker.sourceType = .photoLibrary
            self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.picker.modalPresentationStyle = .popover
            self.present(self.picker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func SaveToCoreData(_ sender: UIButton)
    {
        doescourseinfoexist = true
        
        if(obj.doesCourseInfoExist(eyeDee: ci!) == false)
        {
            obj.addCourseInfo(cID: ci!, cName: CourseField.text!, cNotes: notes, picture1: imgin1! as Data, picture2: imgin2! as Data, picture3: imgin3! as Data)
            
        }
        else    // calls the updateCourseInfo method
        {
            obj.updateCourseInfo(cID: ci!, cName: CourseField.text!, cNotes: notes, picture1: imgin1! as Data, picture2: imgin2! as Data, picture3: imgin3! as Data)
        }
        
        
        
        let alertController = UIAlertController(title: "Saved!", message: "" /*"Saved!"*/, preferredStyle: .alert)
        
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
           self.performSegue(withIdentifier: "backfromdetailedVC", sender: self)
        } //end of OKAction
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func imageadded()
    {
        let alertController = UIAlertController(title: "Image Added!", message: "Image will be displayed once 'Save' is clicked" /*"Saved!"*/, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        } //end of OKAction
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // delegate methods for image picking, etc.
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker .dismiss(animated: true, completion: nil)
        
        if whichimageview[0] == 1                       // first image
        {
            let newImage = UIImage(data: (info[UIImagePickerController.InfoKey.originalImage] as! UIImage).pngData()!)
            self.imgin1 = newImage?.pngData() as! NSData
           
          //  self.ImageView1.image = newImage
     //       ImageView1.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
     //       imgin1 = ImageView1.image!.pngData()! as NSData?
       
            //  imgin1 = info[UIImagePickerController.InfoKey.originalImage] as? NSData
           // ImageView1.image = UIImage(data:imgin1! as Data,scale:1.0)
           // ImageView1.image = UIImage(data:(info[UIImagePickerController.InfoKey.originalImage] as! UIImage).pngData()!)
            //ImageView1.image = UIImage(data:info[UIImagePickerController.InfoKey.originalImage] as! Data,scale:1.0)
            imageadded()
        }
        else if whichimageview[1] == 1                  // second image
        {
            let newImage = UIImage(data: (info[UIImagePickerController.InfoKey.originalImage] as! UIImage).pngData()!)
            self.imgin2 = newImage?.pngData() as! NSData
            
            //self.imgin2 = info[UIImagePickerController.InfoKey.originalImage] as? NSData
            //ImageView2.image = UIImage(data:imgin2! as Data,scale:1.0)
            imageadded()
        }
        else if whichimageview[2] == 1                  // third image
        {
            let newImage = UIImage(data: (info[UIImagePickerController.InfoKey.originalImage] as! UIImage).pngData()!)
            self.imgin3 = newImage?.pngData() as! NSData
            imageadded()
           // imgin3 = info[UIImagePickerController.InfoKey.originalImage] as? NSData
           // ImageView3.image = UIImage(data:imgin3! as Data,scale:1.0)

        }
        
      //  picker .dismiss(animated: true, completion: nil)
    }
    
    
    
/*    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        picker .dismiss(animated: true, completion: nil)
        self.ImageView1.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }*/
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
