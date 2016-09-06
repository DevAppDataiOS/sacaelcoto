//
//  ViewController.swift
//  Saca el coto
//
//  Created by Alfredo Fregoso on 9/5/16.
//  Copyright © 2016 AppData. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let object = PFObject(className: "TestObject")
        object["foo"] = "Alfredo Fregoso"
        object.saveInBackground()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

