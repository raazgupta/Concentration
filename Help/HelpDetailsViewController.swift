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
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        helpText.setContentOffset(.zero, animated: false)
    }
    


}
