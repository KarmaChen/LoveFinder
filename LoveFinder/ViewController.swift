//
//  ViewController.swift
//  LoveFinder
//
//  Created by 陈昆涛 on 16/1/7.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var name: UITextField!

    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var hightNumber: UISlider!
    @IBOutlet weak var result: UITextView!
    @IBOutlet weak var hasProperty: UISwitch!
    @IBOutlet weak var hight: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //当前的类（ func textFieldShouldReturn）会处理这个name.delegate
        name.delegate=self
    }
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hightChanged(sender: AnyObject) {
        let slider = sender as! UISlider
        let i = Int(slider.value)
        slider.value = Float(i)
        hight.text="\(i)厘米"
        
        
    }

    @IBAction func okTapped(sender: AnyObject) {
    let genderText = gender.selectedSegmentIndex==0 ? "高富帅": "白富美"
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let components = gregorian?.components(NSCalendarUnit.Year, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(rawValue: 0))
        let age = components?.year
        let hasPropertyText = hasProperty.on ? "有房":"没房"
        
        result.text="\(name.text!), \(age!)岁, \(genderText), 身高\(hight.text!), \(hasPropertyText), 求交往！"
    }
    //点击右下脚那个按钮会触动这个方法（键盘）
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        }
}





