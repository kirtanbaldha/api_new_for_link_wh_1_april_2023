//
//  ViewController.swift
//  api_new_for_link_wh_1_april_2023
//
//  Created by R&W on 01/04/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var arr : [Datum] = []

   
    @IBOutlet weak var tableViewFor: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Getapi()
    }
    func Getapi(){
        let url = URL(string: "https://myct.store/Mobile_Services/user/v2/index.php/get_area")
        var ur = URLRequest(url: url!)
        ur.httpMethod = "GET"
        URLSession.shared.dataTask(with: ur){data,responce , error in
            do{
               // if data == nil {
                    let obj = try JSONDecoder().decode(Welcome.self, from: data!)
                    self.arr = obj.data
                    DispatchQueue.main.async {
                        self.tableViewFor.reloadData()
                    //}
                }
            }catch{
                print(error)
            }
            
            
        }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.label1.text = arr[indexPath.row].id
        cell.label2.text = arr[indexPath.row].areaName
        cell.label3.text = arr[indexPath.row].city
        cell.label4.text = arr[indexPath.row].dateTime

        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
        
    }
    

}

