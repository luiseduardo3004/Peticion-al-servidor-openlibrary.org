//
//  ViewController.swift
//  Peticion al servidor openlibrary.org
//
//  Created by Luis Santamaría on 4/11/17.
//  Copyright © 2017 Santamaria Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var txtView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtField.clearButtonMode = .Always
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func busqueda (ISBN: String) -> NSString {
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + ISBN
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        if(datos != nil){
            let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            return texto!
        } else {
            return "Revisa tu conexión a Internet";
        }
    }

    @IBAction func ocultarTeclado(sender: UITextField){
        sender.resignFirstResponder()
    }
    
    @IBAction func presentar(sender: AnyObject) {
        let openlibary = busqueda(String(txtField.text!));
        txtView.text = openlibary as String
    }
}

