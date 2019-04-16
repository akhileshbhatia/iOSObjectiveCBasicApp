//
//  Person.swift
//  Person Information
//
//  Created by Akhilesh Bhatia on 12/02/2019.
//  Copyright © 2019 Akhilesh Bhatia. All rights reserved.
//

import Foundation
class Person{
    //Properties
    var name    : String
    var phone   : String
    var address : String
    var image   : String
    var url     : String
    
    
    //Initialisers
    init() {
        self.name     = "Hans"
        self.address  = "No Address Found"
        self.phone    = "none"
        self.image    = "none"
        self.url       = "none"
    }
    
    init(name:String, address:String, phone:String, image:String, url:String) {
        
        self.name     = name
        self.address  = address
        self.phone    = phone
        self.image    = image
        self.url       = url
    }
    
    //Methods
    func setName(name: String) {self.name = name}
    func getName()-> String {return self.name}
    
    func setAddress(address: String) {self.address = address}
    func getAddress()-> String {return self.address}
    
    func setPhone(phone: String) {self.phone = phone}
    func getPhone()-> String {return self.phone}
    
    func setImage(image: String) {self.image = image}
    func getImage()-> String {return self.image}
    
    func setUrl(url: String) {self.url = url}
    func getUrl()-> String {return self.url}
}
