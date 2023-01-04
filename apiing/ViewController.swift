//
//  ViewController.swift
//  apiing
//
//  Created by Nicholas McGinnis on 1/2/23.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtLabel: UILabel!
    @IBOutlet weak var newBtn: UIButton!
    @IBOutlet weak var todayBtn: UIButton!
    
    let session = URLSession.shared
    let url = "https://uselessfacts.jsph.pl"
    let randomFact = "random.json"
    let todaysFact = "today.json"
    let lang = "language=en"
    var urlSource = ""
    let date = Date()
    
    var fact = "" {
        didSet {
            DispatchQueue.main.async {
                self.txtLabel.text = self.fact
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let today = date.formatted(date: .complete, time: .omitted)
        // Do any additional setup after loading the view.
        urlSource = "\(url)/\(randomFact)?\(lang)"
        newBtnTapped(urlSource)
        txtLabel.textAlignment = .center
        txtLabel.textColor = .brown
        txtLabel.numberOfLines = 0
        newBtn.setTitle("Get New Fact", for: .normal)
        todayBtn.setTitle("Get Today's Fact: \(today)", for: .normal)
    }

    @IBAction func newBtnTapped(_ sender: Any) {
        urlSource = "\(url)/\(randomFact)?\(lang)"
        self.caller(from: urlSource)
    }
    
    @IBAction func todayBtnTapped(_ sender: Any) {
        urlSource = "\(url)/\(todaysFact)?\(lang)"
        self.caller(from: urlSource)
    }
}

