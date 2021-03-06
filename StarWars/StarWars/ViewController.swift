//
//  ViewController.swift
//  StarWars
//
//  Created by Maria Lacayo on 05/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let url = URL(string: "https://swapi.dev/api/people/")!
    var people: [String] = []
    @IBOutlet var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        tabla.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(people.count)
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda")
        
        celda?.textLabel?.text = people[indexPath.row]
        return celda!
    }
    
    func getData(){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print("Error",error)
            }else{
               if let data = data{
                    do{
                        let jsonDecoder = JSONDecoder()
                        let parsedJSON = try jsonDecoder.decode(Results.self, from: data)
                        print(parsedJSON.count)
                        for person in parsedJSON.results{
                            print(person.name)
                            self.people.append(person.name)
                        }
                        DispatchQueue.main.async {
                            self.tabla.reloadData()
                        }
                    }catch{
                        print("error")
                    }
                }
            }
        }.resume()
    }

}

