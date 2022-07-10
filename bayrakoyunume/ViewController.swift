//
//  ViewController.swift
//  bayrakoyunume
//
//  Created by Anıl AVCI on 12.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var live: UILabel!
    @IBOutlet weak var skorLabel: UILabel!
    var countries = [String]()
    var score = 0
    var correnctAnswer = 0
    var count = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        kenarlik()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        count += 1
        if count == 5 {
            makeAlert(titleInput: "OYUN BITTI ", messageInput: "Puanınız: \(score)")
            count = 0
            score = 0
            
        } else {
        if sender.tag == correnctAnswer {
            score += 1
            makeAlert(titleInput: "DOĞRU ", messageInput: "Tebrikler doğru cevap \(countries[correnctAnswer].uppercased()) ve puanınız: \(score)")
        } else {
            score -= 1
            makeAlert(titleInput: "YANLIŞ ", messageInput: "Yanlış cevap, Seçmiş olduğunuz bayrak : \(countries[sender.tag].uppercased()) Puanınız: \(score)")
        }
        }
    }
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correnctAnswer = Int.random(in: 1...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        //title = (countries[correnctAnswer].uppercased())
        title = " \(countries[correnctAnswer].uppercased())"
      
        skorLabel.text = "Skor : \(String(score))"
        live.text = "Kalan Hakkınız: \(String(5 - count))"
       
    }
    //alarm
    func makeAlert(titleInput: String, messageInput:String) {
    let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: askQuestion)
alert.addAction(okButton)
    self.present(alert, animated: true, completion: nil)
        }
    //kenarlık tasarım
    func kenarlik() {
        button1.layer.borderWidth = 2
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 2
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
    }
}

