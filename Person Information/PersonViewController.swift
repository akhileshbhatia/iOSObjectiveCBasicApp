//
//  PersonViewController.swift
//  Person Information
//
//  Created by Akhilesh Bhatia on 05/02/2019.
//  Copyright © 2019 Akhilesh Bhatia. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personLabel: UILabel!
    
    @IBAction func moreInfoAction(_ sender: Any) {
    }
    
    
    
    var personData : Person!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Person Info"
        
        //populate outlets with data
        personLabel.text = personData.getName()
        personImageView.image = UIImage(named: personData.getImage())
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let destination = segue.destination as! DetailsViewController //typecasting because segue.destination returns UIViewController
        // Pass the selected object to the new view controller.
        
        destination.personData = self.personData
    }
 

}
