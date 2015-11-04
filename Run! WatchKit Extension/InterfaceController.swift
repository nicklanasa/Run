//
//  InterfaceController.swift
//  Run! WatchKit Extension
//
//  Created by Nickolas Lanasa on 11/2/15.
//  Copyright © 2015 Nytek Productions. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var runPicker: WKInterfacePicker!
    @IBOutlet var walkPicker: WKInterfacePicker!
    
    let pickerStrings = ["30s", "1m", "2m", "3m", "5m", "10m"]
    
    var runPickerSelectedIndex = 0
    var walkPickerSelectedIndex = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var items = Array<WKPickerItem>()
        
        // Configure interface objects here.
        for pickerString in self.pickerStrings {
            let item = WKPickerItem()
            item.title = pickerString
            items.append(item)
        }
        
        self.runPicker.setItems(items)
        self.walkPicker.setItems(items)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return ["walk" : self.pickerStrings[self.walkPickerSelectedIndex],
            "run" : self.pickerStrings[self.runPickerSelectedIndex]]
    }
    
    @IBAction func runPickerValueChanged(value: Int) {
        self.runPickerSelectedIndex = value
    }
    
    @IBAction func walkPickerValueChanged(value: Int) {
        self.walkPickerSelectedIndex = value
    }
}
