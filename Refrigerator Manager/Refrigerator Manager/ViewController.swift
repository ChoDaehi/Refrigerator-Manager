//
//  ViewController.swift
//  Refrigerator Manager
//
//  Created by 조대희 on 2017. 5. 31..
//  Copyright © 2017년 山本大煕. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var contents : [Content] = []
    @IBOutlet var contentTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 /*       let content1 = Content()
        content1.name = "大根"
        content1.limitDate = Date()
        contents.append(content1)
        
        let content2 = Content()
        content2.name = "人参"
        content2.limitDate = Date()
        contents.append(content2)
        
        let content3 = Content()
        content3.name = "玉ねぎ"
        content3.limitDate = Date()
        contents.append(content3)
        
        let content4 = Content()
        content4.name = "ねぎ"
        content4.limitDate = Date()
        contents.append(content4)　*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       let delegate = UIApplication.shared.delegate as! AppDelegate
       if delegate.mode == "Edit" {
            contentTableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food")
        let label = cell?.viewWithTag(1) as! UILabel
        label.text = contents[indexPath.row].name
        let dateLabel = cell?.viewWithTag(2) as! UILabel
        let format = DateFormatter()
        format.dateFormat = "yyyy/MM/dd"
        let strDate = format.string(from: contents[indexPath.row].limitDate)
        dateLabel.text = strDate
        return cell!
    }
    
    
    
    @IBAction func addButton(_ sender: UIButton) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.mode = "Edit"
        let NewContent = Content()
            NewContent.name = ""  
            NewContent.limitDate = Date()
            contents.append(NewContent)
        self.performSegue(withIdentifier: "ToDetail", sender: self)
    }
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.sharedContent = contents[indexPath.row]
        delegate.selectedNum = indexPath.row
        delegate.mode = "Edit"
    
        self.performSegue(withIdentifier: "ToDetail", sender: self )
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

