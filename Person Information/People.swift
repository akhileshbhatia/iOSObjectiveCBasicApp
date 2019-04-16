//
//  People.swift
//  Person Information
//
//  Created by Akhilesh Bhatia on 05/02/2019.
//  Copyright © 2019 Akhilesh Bhatia. All rights reserved.
//

import Foundation

class People{
    var peopleData : [Person];
    //properties
    init(){
        peopleData = [
            Person(name: "Akhilesh Bhatia", address: "Castlewhite", phone: "123456", image: "abc.jpg", url: "www.example.com"),
            Person(name: "Akhilesh", address: "Castlewhite1", phone: "123456", image: "abc.jpg", url: "www.example.com"),
            Person(name: "Akhi", address: "Castlewhite2", phone: "123456", image: "abc.jpg", url: "www.example.com"),
            Person(name: "Akhil", address: "Castlewhite3", phone: "123456", image: "abc.jpg", url: "www.example.com"),
            Person(name: "Bhatia", address: "Castlewhite4", phone: "123456", image: "abc.jpg", url: "www.example.com")
        ]
        
    }
    
    //inits
    init(fromContentOfXML : String){
        //make a XMLPeopleParser
        let parser = XMLPeopleParser(name: fromContentOfXML);
        
        //parsing
        parser.parsing();
        
        //set peopleData with whatever comes from parsing
        peopleData = parser.people;
    }
    //methods
    
    func count() -> Int { return peopleData.count}
    
    func personData(index: Int) -> Person{ return peopleData[index]}
}
