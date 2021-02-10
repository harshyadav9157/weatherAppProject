//
//  ViewController.swift
//  weatherAppProject
//
//  Created by harsh yadav on 28/12/20.
//

import UIKit
import SwiftyJSON
import Foundation


class ViewController: UIViewController, UITextFieldDelegate {
    var arrData = [weatherManger]()
    
    let weatherURL =
        "api.openweathermap.org/data/2.5/weather?&appid=634d28d10f3e2431cc4aee00dd123e1b"
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var sfSymbol: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
    
        
    }
    
    @IBAction func liveLocation(_ sender: UIButton) {
    }
    
    
    @IBAction func Go(_ sender: UIButton) {
        
        print(searchTextField.text!)
        searchTextField.endEditing(true)// means that after entering our text our keyboard is disable from screen.
        
    }
    
    
    
    // differnt types of delegte method used in text fields
    
    //1
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // go statment or for keyboard enter button then it will give us a return valur or text value which we put into our search field.
        
        print(searchTextField.text!)
        searchTextField.endEditing(true)// means after entering our text keyboard get away
        return true
    }
    
    //2
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // when we place a curosr on a search field , then it will say type something or clear
        if textField.text! == " " { // notice here we use onlt textfield word rather than search text field
            return true

        }else{
            textField.placeholder = "type something"
            return false
        }
    }
    
    //3
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // after done searching a text will display to remove a text we use this type of delegate method
        searchTextField.text! = " "
    }
    

    
    func fetchweather(cityName: String){
        
        let urlll = ("\(weatherURL)&q=\(cityName)")
        getData(urlll: urlll)
   
        
    }
    
    func getData(urlll : String) {
        let url  = URL(string: urlll)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else{return
            }
            do{let json = try JSON(data:data)
                print(JSON.self)
               // let object = json["object"] // ye lines change karni h
                //for arr in object.arrayValue{ // ye line change karni h accornding to result
                   // self.arrData.append(weatherManger(json: arr))
                    
                //}
                
            }catch{
                print(error.localizedDescription)
            }

        }.resume()
        
    }

}
