//
//  starwars.swift
//  StarWars
//
//  Created by Maria Lacayo on 05/03/21.
//

struct StarWarsPeople: Codable{
  var name: String
}

struct Results: Codable{
    var results: [StarWarsPeople]
    var count: Int
}
