//
//  ViewController.swift
//  Test-Reigndesign
//
//  Created by Jose David Bustos H on 04-07-18.
//  Copyright © 2018 Jose David Bustos H. All rights reserved.
//

import UIKit

class ViewController: UITableViewController   {

    final let urlString = "https://hn.algolia.com/api/v1/search_by_date?query=ios"
    
    var nameArray = [String]()
    var dobArray = [String]()
    var URLArray = [String]()
    var dateArray = [String]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return nameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
       // let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       // cell.textLabel?.text = foods[indexPath.row]
       // cell.detailTextLabel?.text = foods[indexPath.row]
        cell.namedesc.text = nameArray[indexPath.row]
        cell.nameAutor.text = dobArray[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            nameArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.downloadJsonWithURL()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    
    func downloadJsonWithURL() {
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "hits"))
                
                if let authorArray = jsonObj!.value(forKey: "hits") as? NSArray {
                    for author in authorArray{
                        if let authorDict = author as? NSDictionary {
                            if let name = authorDict.value(forKey: "story_title") {
                                self.nameArray.append(name as! String)
                            }
                            
                           
                            if let name = authorDict.value(forKey: "author")  {
                                
                                if let dates = authorDict.value(forKey: "created_at")  {
                                    self.dateArray.append(dates as! String)
                                     self.dobArray.append((name as! String) + " - " + (dates as! String))
                                }
                               
                            }
                            
                            if let name = authorDict.value(forKey: "story_url") {
                                self.URLArray.append(name as! String)
                            }
                            
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()
                })
            }
        }).resume()
    }
 
 
  override  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.UrlString = URLArray[indexPath.row]
        vc.nameString = nameArray[indexPath.row]
        vc.dobString = dobArray[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
 
}

