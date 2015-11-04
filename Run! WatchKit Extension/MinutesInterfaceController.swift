//
//  MinutesInterfaceController.swift
//  Run!
//
//  Created by Nickolas Lanasa on 11/2/15.
//  Copyright © 2015 Nytek Productions. All rights reserved.
//

import WatchKit
import Foundation


class MinutesInterfaceController: WKInterfaceController {

    @IBOutlet var minutesPicker: WKInterfacePicker!
    
    var minutesSelectedIndex = 0
    
    var context: AnyObject?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        var items = Array<WKPickerItem>()
        
        for (var i = 1; i < 120; i++) {
            let item = WKPickerItem()
            item.title = "\(i)"
            items.append(item)
        }
        
        self.minutesPicker.setItems(items)
    
        self.context = context
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
        if let context = self.context as? [String : AnyObject] {
            var updatedContext = context
            updatedContext["minutes"] = self.minutesSelectedIndex + 1
            return updatedContext
        }
        return nil
    }
}
