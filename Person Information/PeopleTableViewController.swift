//
//  PeopleTableViewController.swift
//  Person Information
//
//  Created by Akhilesh Bhatia on 12/02/2019.
//  Copyright © 2019 Akhilesh Bhatia. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    var peopleData = DBModel().allPeople();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="People data table"
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return peopleData!.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let personData = peopleData![indexPath.row];
        cell.textLabel!.text = (personData as! [String])[0];
        cell.detailTextLabel!.text = (personData as! [String])[1];
        cell.imageView!.image = UIImage(named: (personData as! [String])[3]);

        return cell
    }
 
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PersonViewController
        
        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
        let personData = peopleData![indexPath!.row];
        
        let name = (personData as! [String])[0];
        let phone = (personData as! [String])[1];
        let image = (personData as! [String])[3];
        let address = (personData as! [String])[2];
        let url = (personData as! [String])[4];
        
        destination.personData = Person(name: name, address: address, phone: phone, image: image, url: url)
    }
 

}
