//
//  DetailViewContlloer.swift
//  Refrigerator Manager
//
//  Created by 조대희 on 2017. 5. 31..
//  Copyright © 2017년 山本大煕. All rights reserved.
//

import UIKit

class DetailViewContlloer: UIViewController,UITextFieldDelegate {
    @IBOutlet var nameField:UITextField!
    @IBOutlet var limitDatePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        nameField.text = delegate.sharedContent.name
        limitDatePicker.date = delegate.sharedContent.limitDate
    }
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.sharedContent.name = nameField.text!
        delegate.sharedContent.limitDate = limitDatePicker.date
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
