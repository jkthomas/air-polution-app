//
//  ViewController3.swift
//  AirPolution
//
//  Created by RMS2018 on 13/03/2019.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

class ReceivedDataViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var state = String()
    var city = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = ApiCallBuilder(state: self.state, city: self.city).build()
        let dataReceiver = DataReceiver(url: url)
        dataReceiver.call()
        while(dataReceiver.body.isEmpty){
            //
        }
        self.dataLabel.text = dataReceiver.body
    }
    

}
