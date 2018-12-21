//
//  HelpDetailsViewController.swift
//  Concentration
//
//  Created by Raj Gupta on 19/12/18.
//  Copyright © 2018 SoulfulMachine. All rights reserved.
//

import UIKit

class HelpDetailsViewController: UIViewController {


    @IBOutlet weak var helpText: UITextView!
    
    var helpAttString = NSAttributedString(string: " ")
    var itemSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        helpText.attributedText = helpAttString
        
        /*
        switch itemSelected {
        case 0:
            //backButton.titleLabel?.text = "Back"
            //backButton.titleLabel?.text = "Back"
            backButton.setTitle("Back", for: .normal)
        case 1:
            //backButton.titleLabel?.text = "Zurück"
            //backButton.currentTitle = "Zurück"
            backButton.setTitle("Zurück", for: .normal)
        default:
            break
        }
         */
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
