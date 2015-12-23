//
//  ViewController.swift
//  keiji
//
//  Created by yoru9zine on 12/23/15.
//  Copyright © 2015 yoru9zine. All rights reserved.
//

import Cocoa
import EventKit

class ViewController: NSViewController {
    @IBAction func handleStartButton(sender: AnyObject) {
        let cal = Calendar()
        cal.authorize()
        let start = NSDate()
        let t = Timer(sec: 1)
        t.start()
        let end = NSDate()
        cal.addEvent(start, end: end)
    }
    @IBOutlet weak var startButton: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

