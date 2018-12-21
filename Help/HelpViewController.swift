//
//  HelpViewController.swift
//  Concentration
//
//  Created by Raj Gupta on 17/12/18.
//  Copyright © 2018 SoulfulMachine. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let languageList = ["English", "Deutsch"]
    var itemSelected = 0
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "helpTableCell")
        cell.textLabel?.text = languageList[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemSelected = indexPath.row
        performSegue(withIdentifier: "helpSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "helpSegue" {
            if let cvc = segue.destination as? HelpDetailsViewController {
                //var html = ""
                var title1 = ""
                var description1 = ""
                switch itemSelected {
                case 0:
                    /*
                    html = """
                    <html>
                    <body>
                    <p><strong>How to play Set</strong></p>
                    <p>Cards will match if the following conditions are satisfied: </p>
                    <p>They all have the same number or have three different numbers. <br>They all have the same symbol or have three different symbols. <br>They all have the same shading or have three different shadings. <br>They all have the same color or have three different colors.
                    </p>
                    </body>
                    </html>
                    """
 */
                    title1 = "How to play Set\n\n"
                    description1 = """
                    Cards will match if the following conditions are satisfied:\n
                    They all have the same number or have three different numbers.
                    They all have the same symbol or have three different symbols.
                    They all have the same shading or have three different shadings.
                    They all have the same color or have three different colors.
                    """
                    
                    
                case 1:
                    
                    title1 = "Wie spielt man Set\n\n"
                    description1 = """
                    Karten passen zusammen, wenn die folgenden Bedingungen erfüllt sind:\n
                    Sie haben alle dieselbe Nummer oder drei verschiedene Nummern.
                    Sie haben alle dasselbe Symbol oder drei verschiedene Symbole.
                    Sie haben alle dieselbe Schattierung oder drei verschiedene Schattierungen.
                    Sie haben alle dieselbe Farbe oder drei verschiedene Farben.
                    """
                    
                    /*
                    html = """
                    <html>
                    <body>
                    <p><strong>Wie spielt man Set?</strong></p>
                    <p>Karten passen zusammen, wenn die folgenden Bedingungen erf&uuml;llt sind:</p>
                    <p>Sie haben alle dieselbe Nummer oder drei verschiedene Nummern.
                        <br>Sie haben alle dasselbe Symbol oder drei verschiedene Symbole.
                        <br>Sie haben alle dieselbe Schattierung oder drei verschiedene Schattierungen.
                        <br>Sie haben alle dieselbe Farbe oder drei verschiedene Farben.
                    </p>
                    </body>
                    </html>
                    """*/
                default:
                    //html = " "
                    break
                }
                /*
                let data = Data(html.utf8)
                if let helpAttString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                    cvc.helpAttString = helpAttString
                }
 */
                
                let finalAttrString = NSMutableAttributedString(string: "")
                let titleAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
                let title1AttrString = NSMutableAttributedString(string: title1, attributes: titleAttributes)
                let descriptionAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
                let description1AttrString = NSMutableAttributedString(string: description1, attributes: descriptionAttributes)
                
                finalAttrString.append(title1AttrString)
                finalAttrString.append(description1AttrString)
                
                cvc.helpAttString = finalAttrString
                cvc.itemSelected = itemSelected
                
            }
        }
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
