//
//  ViewController.swift
//  UIKitProject1
//
//  Created by AndrewLuo on 2023-10-13.
//

import UIKit

class ViewController: UITableViewController {

    var pictures: [String] = [] // var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

        let fm = FileManager.default // work with file system
        let path = Bundle.main.resourcePath! // set the resource path of app's bundle (bundle is a directory containing all compiled program and all assets
        let items = try! fm.contentsOfDirectory(atPath: path) // list all contents, so it will be an array of strings containing filenames
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures = pictures.sorted()
    }
    
    // func tableView explaintion:
    // numberOfRowsInSection: this code will be triggered when iOS wants to know how many rows are in the table view.
    // The section part is there because table views can be split into sections, like the way the Contacts app separates names by first letter.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count // ought to be the number of rows to show in table
    }
    
    // function tableView explaintion:
    // The method is called cellForRowAt, and will be called when you need to provide a row. The row to show is specified in the parameter: indexPath, which is of type IndexPath. This is a data type that contains both a section number and a row number. We only have one section, so we can ignore that and just use the row number.
    // -> UITableViewCell means this method must return a table view cell. If you remember, we created one inside Interface Builder and gave it the identifier “Picture”, so we want to use that.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row] // The cell has a property called textLabel, but it’s optional: there might be a text label, or there might not be – if you had designed your own, for example. Rather than write checks to see if there is a text label or not, Swift lets us use a question mark – textLabel? – to mean “do this only if there is an actual text label there, or do nothing otherwise.”
        return cell // expects a table view cell to be returned
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImageIndex = indexPath.row + 1
            vc.imageAmount = pictures.count
            vc.selectedImage = pictures[indexPath.row]
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

