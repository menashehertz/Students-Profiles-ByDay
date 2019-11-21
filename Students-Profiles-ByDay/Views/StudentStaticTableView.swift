//
//  StudentStaticTableView.swift
//  Students-Profiles-ByDay
//
//  Created by Steven Hertz on 11/19/19.
//  Copyright © 2019 DevelopItSolutions. All rights reserved.
//

import UIKit

protocol StudentUpdaterDelegate {
    func upDateStudentAppProfileForDay(_ day:Int, with profile: AppProfile)
}

class StudentStaticTableView: UITableViewController, StudentUpdaterDelegate {
    
    
    @IBOutlet var profileForDayLabel: [UILabel]!
    
    @IBOutlet weak var notesLabel: UITextView!

    var dayOfWeekPassed : Int?
    var store : StudentStore!
    var student: Student! {
        didSet {
            Student.saveTheStudent(self.student)
        }
    }

/*
    override func viewDidAppear(_ animated: Bool) {
        // 1
        let nav = self.navigationController?.navigationBar
      
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
      
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
          
        // 4
        let image = UIImage(named: "Apple_Swift_Logo")
        imageView.image = image
          
        // 5
        navigationItem.titleView = imageView
        
    }
*/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        for item in 0...4 {
//            profileForDayLabel[item].text = "a"
//        }
//
        print("in view will appear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        student = Student.getTheStudent()
        
        store = StudentStore()
        
        let student = store.student
        
        profileForDayLabel[0].text = student.mondayName
        profileForDayLabel[1].text = student.tuesdayName
        profileForDayLabel[2].text = student.wednesdayName
        profileForDayLabel[3].text = student.thursdayName
        profileForDayLabel[4].text = student.fridayName
        
//        store.student.notes = "44"
//        store.saveTheStudent()
        
        
        
        
        
       
        AppProfileFunctions.readAppProfiles { list in
            print(list[1].title)
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func upDateStudentAppProfileForDay(_ day: Int, with profile: AppProfile) {
        switch day {
        case 0:
            store.student.mondayName = profile.title
        case 1:
            store.student.tuesdayName = profile.title
        case 2:
            store.student.wednesdayName = profile.title
        case 3:
            store.student.thursdayName = profile.title
        case 4:
            store.student.fridayName = profile.title
        default:
            break
        }
        profileForDayLabel[day].text = profile.title
        
        Student.saveTheStudent(self.store.student)
    }


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }

     // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

     // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

     // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let row = tableView.indexPathForSelectedRow!.row
        let section = tableView.indexPathForSelectedRow!.section
        
        guard let destVC = segue.destination as? AppProfilesTableViewController else {fatalError("Could not cast view controller to AppList")}
        destVC.store = store
        destVC.dayOfWeek = row
        destVC.studentUpdaterDelegate = self
        
        print(store.student.notes)
        print("in prepare for Segue and the row number is \(row) and section is \(section)")

    }
    
//    if let cell = tableView.cellForRow(at: indexPath), let identifier = cell.reuseIdentifier {
//        var segueID = ""
//        switch identifier {
//        case "Type1Cell": segueID = "GoToFirst"
//        case "Type2Cell": segueID = "GoToSecond"
//        default: return
//        }
//        performSegue(withIdentifier: segueID, sender: self)
//    }

 
}
