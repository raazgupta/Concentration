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
        cell.textLabel?.textColor = #colorLiteral(red: 0.1490196078, green: 0.3294117647, blue: 0.4862745098, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemSelected = indexPath.row
        performSegue(withIdentifier: "helpSegue", sender: self)
    }
    
    func findString(aString:String, aSubString: String) -> NSRange {
        if aString.contains(aSubString) {
            let foundIndex = aString.index(of: aSubString)
            let intIndex = aString.distance(from: aString.startIndex, to: foundIndex!)
            return NSRange(location: intIndex, length: aSubString.count)
        }
        else {
            return NSRange(location: 0, length: 0)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "helpSegue" {
            if let cvc = segue.destination as? HelpDetailsViewController {

                let highlightAttributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: #colorLiteral(red: 0.937254902, green: 0.2784313725, blue: 0.4352941176, alpha: 1)
                ]
                
                let titleAttributes: [NSAttributedString.Key:Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 16),
                    .foregroundColor: #colorLiteral(red: 0.1490196078, green: 0.3294117647, blue: 0.4862745098, alpha: 1)
                ]
                
                let descriptionAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 14),
                    .foregroundColor: #colorLiteral(red: 0.1490196078, green: 0.3294117647, blue: 0.4862745098, alpha: 1)
                ]
                
                let finalAttrString = NSMutableAttributedString(string: "")

                switch itemSelected {
                case 0:

                    let title1AttrString = NSMutableAttributedString(string: "How to play Set?\n\n", attributes: titleAttributes)
                    
                    let description1AttrString = NSMutableAttributedString(string: "The goal of the game is to find all possible Matches in the deck.\n\n", attributes: descriptionAttributes)
                    
                    let description2AttrString = NSMutableAttributedString(string: "Cards will match if all the following conditions are satisfied:\n", attributes: descriptionAttributes)
                    description2AttrString.addAttributes(highlightAttributes, range: findString(aString: "Cards will match if all the following conditions are satisfied:\n", aSubString: "match"))
                    
                    
                    let description3AttrString = NSMutableAttributedString(string: """
                    \u{2022} They all have the same number or have three different numbers.
                    \u{2022} They all have the same symbol or have three different symbols.
                    \u{2022} They all have the same shading or have three different shadings.
                    \u{2022} They all have the same color or have three different colors.\n\n
                    """, attributes: descriptionAttributes)
                    
                    let description4AttrString = NSMutableAttributedString(string: "To show more cards on screen Swipe Down\n\n", attributes: descriptionAttributes)
                    description4AttrString.addAttributes(highlightAttributes, range: findString(aString: "To show more cards on screen Swipe Down\n",aSubString: "Swipe Down"))
                    
                    
                    let title2AttrString = NSMutableAttributedString(string: "AI Mode\n\n", attributes: titleAttributes)
                    let description5String = "If you want a challenge, Switch On the AI button. The AI will try to match the cards at the same time as you. Let's see who can match faster!\n"
                    let description5AttrString = NSMutableAttributedString(string: description5String, attributes: descriptionAttributes)
                    description5AttrString.addAttributes(highlightAttributes, range: findString(aString: description5String, aSubString: "Switch On"))
                    description5AttrString.addAttributes(highlightAttributes, range: findString(aString: description5String, aSubString: "AI"))
                    
                    let description6String = "If you find this mode too easy, you can also Switch On the AI and HM (Hard Mode) buttons. Now the AI will be much more aggressive when searching for matches.\n\n"
                    let description6AttrString = NSMutableAttributedString(string: description6String, attributes: descriptionAttributes)
                    description6AttrString.addAttributes(highlightAttributes, range: findString(aString: description6String, aSubString: "Switch On"))
                    description6AttrString.addAttributes(highlightAttributes, range: findString(aString: description6String, aSubString: "AI"))
                    description6AttrString.addAttributes(highlightAttributes, range: findString(aString: description6String, aSubString: "HM"))
                    
                    let title3AttrString = NSMutableAttributedString(string: "Multi Player Mode\n\n", attributes: titleAttributes)
                    
                    let description7String = "You can also play with a friend when you Switch On the MP (Multi Player) button. If Player 1 finds a match and wants to score, Swipe Left first and then select cards that might match. If Player 2 finds a match and wants to score, Swipe Right first and then select cards that might match. Let's see which Player gets the highest score!"
                    
                    let description7AttrString = NSMutableAttributedString(string: description7String, attributes: descriptionAttributes)
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "Switch On"))
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "MP"))
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "Player 1"))
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "Swipe Left"))
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "Player 2"))
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "Swipe Right"))
                    
                    finalAttrString.append(title1AttrString)
                    finalAttrString.append(description1AttrString)
                    finalAttrString.append(description2AttrString)
                    finalAttrString.append(description3AttrString)
                    finalAttrString.append(description4AttrString)
                    finalAttrString.append(title2AttrString)
                    finalAttrString.append(description5AttrString)
                    finalAttrString.append(description6AttrString)
                    finalAttrString.append(title3AttrString)
                    finalAttrString.append(description7AttrString)
                    
                    
                case 1:
                    
                    let title1AttrString = NSMutableAttributedString(string: "Wie spielt man Set?\n\n", attributes: titleAttributes)
                    
                    let description1AttrString = NSMutableAttributedString(string: "Das Ziel des Spiels ist es, alle möglichen Spiele im Deck zu finden.\n\n", attributes: descriptionAttributes)
                    
                    let description2AttrString = NSMutableAttributedString(string: "Karten passen zusammen, wenn alle folgenden Bedingungen erfüllt sind:\n", attributes: descriptionAttributes)
                    description2AttrString.addAttributes(highlightAttributes, range: findString(aString: "Karten passen zusammen, wenn alle folgenden Bedingungen erfüllt sind:\n", aSubString: "passen zusammen"))
                    
                    
                    let description3AttrString = NSMutableAttributedString(string: """
                    \u{2022} Sie haben alle dieselbe Nummer oder drei verschiedene Nummern.
                    \u{2022} Sie haben alle dasselbe Symbol oder drei verschiedene Symbole.
                    \u{2022} Sie haben alle dieselbe Schattierung oder drei verschiedene Schattierungen.
                    \u{2022} Sie haben alle dieselbe Farbe oder drei verschiedene Farben.\n\n
                    """, attributes: descriptionAttributes)
                    
                    let description4AttrString = NSMutableAttributedString(string: "Um mehr Karten auf dem Bildschirm anzuzeigen, streichen Sie nach unten\n\n", attributes: descriptionAttributes)
                    description4AttrString.addAttributes(highlightAttributes, range: findString(aString: "Um mehr Karten auf dem Bildschirm anzuzeigen, streichen Sie nach unten\n\n",aSubString: "streichen Sie nach unten"))
                    
                    
                    let title2AttrString = NSMutableAttributedString(string: "AI-Modus\n\n", attributes: titleAttributes)
                    let description5String = "Wenn Sie eine Herausforderung wünschen, schalten Sie die AI-Schaltfläche ein. Die KI versucht, die Karten zur gleichen Zeit wie Sie zu finden. Mal sehen, wer schneller zuschlagen kann!\n"
                    let description5AttrString = NSMutableAttributedString(string: description5String, attributes: descriptionAttributes)
                    description5AttrString.addAttributes(highlightAttributes, range: findString(aString: description5String, aSubString: "schalten"))
                    description5AttrString.addAttributes(highlightAttributes, range: findString(aString: description5String, aSubString: "AI"))
                    
                    let description6String = "Wenn Sie diesen Modus als zu einfach empfinden, können Sie auch die AI- und HM-Tasten (Hard Mode) einschalten. Jetzt wird die AI bei der Suche nach Übereinstimmungen viel aggressiver.\n\n"
                    let description6AttrString = NSMutableAttributedString(string: description6String, attributes: descriptionAttributes)
                    description6AttrString.addAttributes(highlightAttributes, range: findString(aString: description6String, aSubString: "einschalten"))
                    description6AttrString.addAttributes(highlightAttributes, range: findString(aString: description6String, aSubString: "AI"))
                    description6AttrString.addAttributes(highlightAttributes, range: findString(aString: description6String, aSubString: "HM"))
                    
                    let title3AttrString = NSMutableAttributedString(string: "Mehrspielermodus\n\n", attributes: titleAttributes)
                    
                    let description7String = "Sie können auch mit einem Freund spielen, wenn Sie die MP (Multi Player) -Taste einschalten. Wenn Spieler 1 eine Übereinstimmung findet und punkten möchte, streichen Sie zuerst nach links und wählen Sie dann Karten aus, die möglicherweise übereinstimmen. Wenn Spieler 2 eine Übereinstimmung findet und punkten möchte, streichen Sie zuerst nach rechts und wählen Sie dann Karten aus, die möglicherweise übereinstimmen. Mal sehen, welcher Spieler die höchste Punktzahl erreicht!"
                    
                    let description7AttrString = NSMutableAttributedString(string: description7String, attributes: descriptionAttributes)
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "einschalten"))
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "MP"))
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "Spieler 1"))
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "streichen Sie zuerst nach links"))
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "Spieler 2"))
                    description7AttrString.addAttributes(highlightAttributes, range: findString(aString: description7String, aSubString: "streichen Sie zuerst nach rechts"))
                    
                    finalAttrString.append(title1AttrString)
                    finalAttrString.append(description1AttrString)
                    finalAttrString.append(description2AttrString)
                    finalAttrString.append(description3AttrString)
                    finalAttrString.append(description4AttrString)
                    finalAttrString.append(title2AttrString)
                    finalAttrString.append(description5AttrString)
                    finalAttrString.append(description6AttrString)
                    finalAttrString.append(title3AttrString)
                    finalAttrString.append(description7AttrString)
                    

                default:
                    break
                }

                
                cvc.helpAttString = finalAttrString
                cvc.itemSelected = itemSelected
                
            }
        }
    }

}

extension StringProtocol where Index == String.Index {
    func index(of string: Self, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func endIndex(of string: Self, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
    func indexes(of string: Self, options: String.CompareOptions = []) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while start < endIndex,
            let range = self[start..<endIndex].range(of: string, options: options) {
                result.append(range.lowerBound)
                start = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    func ranges(of string: Self, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while start < endIndex,
            let range = self[start..<endIndex].range(of: string, options: options) {
                result.append(range)
                start = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}


