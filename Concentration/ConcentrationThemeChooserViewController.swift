//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Raj Gupta on 22/7/18.
//  Copyright © 2018 SoulfulMachine. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {
    
    private let themes = ["Halloween": "🎃👻🦇😱👿👺🤡👽",
                          "Animals": "🐼🦄🐰🐯🐷🐶🦕🦖",
                          "Faces": "😇😍😭🤥🎅🏽😡👨‍👩‍👧‍👦🧛🏻‍♀️",
                          "Foods": "🥑🌭🌮🍱🍕🍙🍣🍉",
                          "Travel": "🚀⛵️🛳🏰🌋🌅⛩🕌",
                          "Flags": "🇮🇳🇩🇪🇷🇺🇯🇵🇺🇸🇸🇬🇬🇧🇺🇦"
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondayViewController:UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondayViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {

            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = (themeName,theme)
                    lastSequedToConcentrationViewController = cvc
                }
            }
            
        }
    }
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
        
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = (themeName,theme)
            }
        } else if let cvc = lastSequedToConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = (themeName,theme)
            }
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    private var lastSequedToConcentrationViewController: ConcentrationViewController?
    
    

}
