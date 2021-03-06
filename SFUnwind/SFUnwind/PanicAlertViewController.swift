//
// PanicAlertViewController.swift - View Controller for the Panic Alert Feature screen
// SFUnwind
// Project Group 5: SFU CMPT 276
// Primary programmer: Adam Badke #301310785
// Contributing Programmers: David Magaril #301274978
// Known issues: 
//
// Note: All files in this project conform to the coding standard included in the SFUnwind HW3 Quality Assurance Documentation


import UIKit
import ContactsUI
import MessageUI


class PanicAlertViewController: UIViewController, CNContactPickerDelegate, MFMessageComposeViewControllerDelegate, CNContactViewControllerDelegate {
    
    // Properties:
    //******************
    
    // Panic Alert file names (constants). The name of each panic alert text file to be loaded:
    let alertFiles = ["alert01", "alert02", "alert03", "alert04", "alert05"] // Store the alert file names in a (constant) array, to allow easier iteration through each.
    var alertExists = [false, false, false, false, false] // A boolean array: Tracks wheter or not the current contact has a pre-created alert or not
    
    var currentContact = 0      // Tracker variable: Lets us keep track of which contact is being interacted with. 0 (default) indicates no tracker, 1-5 correspond with contacts 1-5
    
    // UI buttons:
    //************
    // For each:
    //--
    // Input: Sender
    // Output: None
    // No dependencies
    //--
    // Contact 1: Create/send
    @IBOutlet weak var contact1CreateSendBtn: UIButton!
    @IBAction func contact1CreateSendBtn(_ sender: Any) {
        // User has tapped the Create/Send button:
        currentContact = 1                                      // Update the contact tracking variable
        handleCreateSendBtn(contactIndex: 0)                    // Call the generic create/send button handler
    }
    // Contact 1: Edit
    @IBOutlet weak var contact1EditBtn: UIButton! // Outletƒ
    @IBAction func contact1EditBtn(_ sender: Any) { // Action
        currentContact = 1                                      // Update the contact tracking variable
    }
    
    // Contact 2: Create/send
    @IBOutlet weak var contact2CreateSendBtn: UIButton! // Outlet
    @IBAction func contact2CreateSendBtn(_ sender: Any) { // Action
        currentContact = 2                                      // Update the contact tracking variable
        handleCreateSendBtn(contactIndex: 1)                    // Call the generic create/send button handler
    }
    // Contact 2: Edit
    @IBOutlet weak var contact2EditBtn: UIButton! // Outlet
    @IBAction func contact2EditBtn(_ sender: Any) { // Action
        currentContact = 2                                      // Update the contract tracking variable
    }
    
    // Contact 3: Create/send
    @IBOutlet weak var contact3CreateSendBtn: UIButton! // Outlet
    @IBAction func contact3CreateSendBtn(_ sender: Any) { // Action
        currentContact = 3                                      // Update the contract tracking variable
        handleCreateSendBtn(contactIndex: 2)                    // Call the generic create/send button handler
    }
    // Contact 3: Edit
    @IBOutlet weak var contact3EditBtn: UIButton! // Outlet
    @IBAction func contact3EditBtn(_ sender: Any) { // Action
        currentContact = 3                                      // Update the contract tracking variable
    }
    
    // Contact 4: Create/send
    @IBOutlet weak var contact4CreateSendBtn: UIButton! // Outlet
    @IBAction func contact4CreateSendBtn(_ sender: Any) { // Action
        currentContact = 4                                      // Update the contract tracking variable
        handleCreateSendBtn(contactIndex: 3)                    // Call the generic create/send button handler
    }
    // Contact 4: Edit
    @IBOutlet weak var contact4EditBtn: UIButton! // Outlet
    @IBAction func contact4EditBtn(_ sender: Any) { // Action
        currentContact = 4                                      // Update the contract tracking variable
    }
    
    // Contact 5: Create/send
    @IBOutlet weak var contact5CreateSendBtn: UIButton! // Outlet
    @IBAction func contact5CreateSendBtn(_ sender: Any) { // Action
        currentContact = 5                                      // Update the contract tracking variable
        handleCreateSendBtn(contactIndex: 4)                    // Call the generic create/send button handler
    }
    // Contact 5: Edit
    @IBOutlet weak var contact5EditBtn: UIButton! // Outlet
    @IBAction func contact5EditBtn(_ sender: Any) { // Action
        currentContact = 5                                      // Update the contract tracking variable
    }
    
    // Help button
    //*************
    @IBAction func helpButton(_ sender: Any) {

    }
    
    // Numeric labels
    @IBOutlet weak var row1NumericLabel: UILabel!
    @IBOutlet weak var row2NumericLabel: UILabel!
    @IBOutlet weak var row3NumericLabel: UILabel!
    @IBOutlet weak var row4NumericLabel: UILabel!
    @IBOutlet weak var row5NumericLabel: UILabel!
    
    
    // Contact name text labels:
    @IBOutlet weak var contact1Text: UILabel! // Contact 1
    @IBOutlet weak var contact2Text: UILabel! // Contact 2
    @IBOutlet weak var contact3Text: UILabel! // Contact 3
    @IBOutlet weak var contact4Text: UILabel! // Contact 4
    @IBOutlet weak var contact5Text: UILabel! // Contact 5
    
    
    // Counselling contact links
    // Open the SFU Counselling website:
    @IBOutlet weak var weblinkBtn: UIButton!
    // Input: Sender
    // Output: None
    // No dependencies
    @IBAction func weblinkBtn(_ sender: Any) {
        
        let theUrl = URL(string: "https://www.sfu.ca/students/health/services/counselling.html")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(theUrl)
        } else {
            UIApplication.shared.openURL(theUrl)
        }
    }

    // Dial the SFU Counselling phone number:
    @IBOutlet weak var phoneLinkBtn: UIButton!
    // Input: Sender
    // Output: None
    // No dependencies
    @IBAction func phoneLinkBtn(_ sender: Any) {
               
        let theNumber = URL(string: "tel://7787824615")

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(theNumber!)
            print("10")
        } else {
            UIApplication.shared.openURL(theNumber!)
            print("else")
        }
    }

 
    
    // PanicAlertViewController Class methods/functions:
    //**************************************************
    
    // ViewDidLoad: This function is called once when the PanicAlertViewController.swift object is first initialized.
    // This function is used to trigger the various UI updates required to set up the screen
    // Input: None
    // Output: None
    // No dependencies
    override func viewDidLoad() {
        super.viewDidLoad() // Call the superclass's viewDidLoad function
        
        // Call the alert list initialization function, which updates the UI elements with the correct, loaded text:
        initializeAlertList()

        // Handle formatting of numeric row labels
        row1NumericLabel.numberOfLines = 0
        row1NumericLabel.adjustsFontSizeToFitWidth = true
        row2NumericLabel.numberOfLines = 0
        row2NumericLabel.adjustsFontSizeToFitWidth = true
        row3NumericLabel.numberOfLines = 0
        row3NumericLabel.adjustsFontSizeToFitWidth = true
        row4NumericLabel.numberOfLines = 0
        row4NumericLabel.adjustsFontSizeToFitWidth = true
        row5NumericLabel.numberOfLines = 0
        row5NumericLabel.adjustsFontSizeToFitWidth = true
        
        // Round corners of buttons
        self.contact1EditBtn.layer.cornerRadius = 10
        self.contact2EditBtn.layer.cornerRadius = 10
        self.contact3EditBtn.layer.cornerRadius = 10
        self.contact4EditBtn.layer.cornerRadius = 10
        self.contact5EditBtn.layer.cornerRadius = 10
        self.contact1CreateSendBtn.layer.cornerRadius = 10
        self.contact2CreateSendBtn.layer.cornerRadius = 10
        self.contact3CreateSendBtn.layer.cornerRadius = 10
        self.contact4CreateSendBtn.layer.cornerRadius = 10
        self.contact5CreateSendBtn.layer.cornerRadius = 10
        
        // Handle formatting of the SFU Counselling contact information:
        weblinkBtn.titleLabel?.numberOfLines = 1
        weblinkBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        phoneLinkBtn.titleLabel?.numberOfLines = 1
        phoneLinkBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    }

    
    // Handle the transition to the help / popup edit screens:
    // Input: Storyboard Segue, Sender
    // Output: None
    // Dependency: viewDidLoad() has ran
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Handle the help screen:
        if let destinationView = segue.destination as? HelpViewController {
            destinationView.callingScreen = 3 // Notify the popup who's calling it
        }
        // Handle the create/edit popup:
        else if let destinationView = segue.destination as? PanicAlertPopupViewController {
            
            destinationView.recievedAlert = getStoredAlerts(filename: alertFiles[currentContact - 1]) // Pass the current alert text
            
            destinationView.recievedAlertIndex = currentContact// Pass the filename index
            
        }
    }
    
    // Save alert contact text data to a txt file. Called when creating/editing an alert
    // Argument: contactProperty - A CNContactProperty object, recieved from the CNContactPicker as selected by the user
    // Note: This function requires UI interaction and must be manually tested on a physical iOS device
    // Input: Stringx3, Int
    // Output: None
    // Dependency: viewDidLoad() has ran
    func setStoredAlert(theName: String, theNumber: String, theMessage: String, recievedAlertIndex: Int){
        
        // Get the documents directory:
        if let theDocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            // Select the right filename
            var filename = String()
            
            switch recievedAlertIndex { // Use the recieved tracking variable to select the correct filename
            case 1:
                filename = alertFiles[0]
            case 2:
                filename = alertFiles[1]
            case 3:
                filename = alertFiles[2]
            case 4:
                filename = alertFiles[3]
            case 5:
                filename = alertFiles[4]
            default: // We should never reach this point
                filename = alertFiles[0] // Use the first entry as the default, just in case.
            }
            // Append the filename to the documents directory:
            let thePath = theDocumentsDirectory.appendingPathComponent(filename)
            
            // Write to the file
            do {
                var fileData: String
                if theName == "" && theNumber == "" && theMessage == "" {
                    fileData = ""
                }
                else {
                    fileData = theName + "\n" + theNumber + "\n" + theMessage // Assemble the extracted data for storage
                }
                
                // Update the alert file with the extracted information:
                try fileData.write(to: thePath, atomically: false, encoding: String.Encoding.utf8)
                
            }
            catch {
                //currentContact = 0 // Reset the tracker to the default value
                return
            }
        }
    } // End file writing
    // Input: Animated Bool
    // Output: None
    // No dependencies
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initializeAlertList()
    }
    
    // Initialize the alert list. Loads the alert details from file, and sets up the UI to display the correct values
    // Input: None
    // Output: None
    // No dependencies
    func initializeAlertList() {
        
        // Load each alert file:
        var contactNumber = 1 // Loop iterator variable
        for alert in alertFiles{ // Loop, loading each alert file listed in the array of alert filenames
            
            var currentAlertText = getStoredAlerts(filename: alert) // Load the current alert filename (ie. alert01.txt to alert05.txt) from the documents directory, as an array of strings
            
            // Set the alert name label text:
            switch contactNumber{
            case 1: // Contact 1
                if currentAlertText == nil || (currentAlertText?.count)! < 3 { // Handle empty or malformed alert files: Set the label to blank, and button to "create"
                    contact1Text.text = ""                            // Set the contact name text label to the first line in the alert file
                    contact1CreateSendBtn.setTitle("Create", for: .normal)    // Update the send/create button text
                    contact1EditBtn.isHidden = true
                    alertExists[0] = false
                } else{ // Otherwise, set the contact name text label to the first line in the alert file
                    contact1Text.text = currentAlertText?[0]
                    contact1CreateSendBtn.updateUserActivityState(NSUserActivity(activityType: "normal"))
                    contact1CreateSendBtn.setTitle("Send", for: .normal)
                    contact1EditBtn.isHidden = false
                    alertExists[0] = true
                }

            case 2: // Contact 2
                if currentAlertText == nil || (currentAlertText?.count)! < 3 { // Handle empty or malformed alert files: Set the label to blank
                    contact2Text.text = ""                            // Set the contact name text label to the first line in the alert file
                    contact2CreateSendBtn.setTitle("Create", for: .normal)    // Update the send/create button text
                    contact2EditBtn.isHidden = true
                    alertExists[1] = false
                    
                } else{ // Otherwise, set the contact name text label to the first line in the alert file
                    contact2Text.text = currentAlertText?[0]
                    contact2CreateSendBtn.setTitle("Send", for: .normal)
                    contact2EditBtn.isHidden = false
                    alertExists[1] = true
                }
                
            case 3: // Contact 3
                if currentAlertText == nil || (currentAlertText?.count)! < 3 { // Handle empty or malformed alert files: Set the label to blank
                    contact3Text.text = ""                            // Set the contact name text label to the first line in the alert file
                    contact3CreateSendBtn.setTitle("Create", for: .normal)    // Update the send/create button text
                    contact3EditBtn.isHidden = true
                    alertExists[2] = false
                    
                } else{ // Otherwise, set the contact name text label to the first line in the alert file
                    contact3Text.text = currentAlertText?[0]
                    contact3CreateSendBtn.setTitle("Send", for: .normal)
                    contact3EditBtn.isHidden = false
                    alertExists[2] = true
                }
                
            case 4: // Contact 4
                if currentAlertText == nil || (currentAlertText?.count)! < 3 { // Handle empty or malformed alert files: Set the label to blank
                    contact4Text.text = ""                            // Set the contact name text label to the first line in the alert file
                    contact4CreateSendBtn.setTitle("Create", for: .normal)    // Update the send/create button text
                    contact4EditBtn.isHidden = true
                    alertExists[3] = false
                    
                } else{ // Otherwise, set the contact name text label to the first line in the alert file
                    contact4Text.text = currentAlertText?[0]
                    contact4CreateSendBtn.setTitle("Send", for: .normal)
                    contact4EditBtn.isHidden = false
                    alertExists[3] = true
                }
                
            case 5: // Contact 5
                if currentAlertText == nil || (currentAlertText?.count)! < 3 { // Handle empty or malformed alert files: Set the label to blank
                    contact5Text.text = ""                            // Set the contact name text label to the first line in the alert file
                    contact5CreateSendBtn.setTitle("Create", for: .normal)    // Update the send/create button text
                    contact5EditBtn.isHidden = true
                    alertExists[4] = false
                    
                } else{ // Otherwise, set the contact name text label to the first line in the alert file
                    contact5Text.text = currentAlertText?[0]
                    contact5CreateSendBtn.setTitle("Send", for: .normal)
                    contact5EditBtn.isHidden = false
                    alertExists[4] = true
                }
                
            default: // We should never reach this point. Break.
                break
                
            }
            contactNumber += 1 // Increment the contact counter
        }// end for

    } // end initializeAlertList()
    
    
    // Load alert text data stored in a txt file. Called once per alert at initialization, and whenever alerts are sent
    // Argument: filename - A string, containing the filename of the text file to be loaded. Note: Filename does NOT include the .txt extension, as this is passed as an argument to the iOS file manager bundle.
    // Return: An array of strings read line by line from the file, or nil if the file was empty
    // Dependency: viewDidLoad() has ran
    func getStoredAlerts(filename: String) -> [String]? {
        
        // Attempt to open the file:
        if let theDocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let thePath = theDocumentsDirectory.appendingPathComponent(filename) // Append the filename to the path
            
            // Read from the file:
            do {
                let fileContents = try String(contentsOf: thePath, encoding: String.Encoding.utf8)
                return fileContents.components(separatedBy: "\n") // Return the file contents as an array, with each line as an element
            }
            catch { // Handle read errors: Return nil
                return nil
            }
        }
        return nil // Return nil: We should only reach this if something went wrong
    }
    
    
    // Handle the create/send button functionality
    // Argument: contactIndex - The array index of the relevant alert file to use [0, 5]
    // Note: This function requires UI interaction and must be manually tested on a physical iOS device
    // Dependency: viewDidLoad() has ran
    func handleCreateSendBtn(contactIndex: Int){
        // Create a new contact if none exists:
        if alertExists[contactIndex] == false {
            performSegue(withIdentifier: "createEditSegue", sender: self) // Handle the segue transition
        }
        else { //  Otherwise, send the alert if one exists:
            let theAlert = getStoredAlerts(filename: alertFiles[contactIndex]) // Get the alert message from the file
            
            if (theAlert?.count)! >= 3 { // Ensure the alert message file is not malformed
                sendAlertMessage(message: (theAlert?[2])!, phoneNumber: (theAlert?[1])!) // Insert the alert elements into a text message
            }
        }
    }
    
    
    // Send a pre-formatted alert message using the iOS messenger app:
    // Note: This function requires UI interaction and must be manually tested on a physical iOS device
    // Input: String, String
    // Output: None
    // Dependency: viewDidLoad() has ran
    func sendAlertMessage(message: String, phoneNumber: String){
        // Create a text message view controller, and insert our alert data into it:
        if (MFMessageComposeViewController.canSendText() ){
            let txtMsgView = MFMessageComposeViewController() // Create the controller
            txtMsgView.body = message // Insert the alert message text into the message body
            txtMsgView.recipients = [phoneNumber] // Insert the alert phone number into the message phone number field
            
            // Display the text message view:
            txtMsgView.messageComposeDelegate = self
            present(txtMsgView, animated: true, completion: nil)
        }
    }
   
    
    // MFMessageComposeViewControllerDelegate protocol functions:
    //***********************************************************
    // Handle dismissing:
    // Input: Controller, MessageComposeResult
    // Output: None
    // No dependencies
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    // Handle view removal:
    // Input: Animated Bool
    // Output: None
    // No dependencies
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
} // End panic alert view controller class
