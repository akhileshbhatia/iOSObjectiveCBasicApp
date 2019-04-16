//
//  DetailsViewController.swift
//  Person Information
//
//  Created by Akhilesh Bhatia on 05/02/2019.
//  Copyright © 2019 Akhilesh Bhatia. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBAction func webInfoAction(_ sender: Any) {
        
    }
    
    var personData : Person!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Person Details"
        
        //populate outlets with data
        nameLabel.text = personData.getName()
        phoneLabel.text = personData.phone
        addressLabel.text = personData.getAddress()
        urlLabel.text = personData.getUrl()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
 
    
}
