//
//  Timer.swift
//  keiji
//
//  Created by yoru9zine on 12/31/15.
//  Copyright © 2015 yoru9zine. All rights reserved.
//

import Foundation

func hoge(){
    print(1)
}

class Timer: NSObject {
    var sec: Int
    var count: Int
    var timer: NSTimer? = nil

    init(sec n: Int){
        self.sec = n
        self.count = 0
    }

    func start(){
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "cb", userInfo: nil, repeats: true)
        self.timer?.fire()
    }

    func stop(){
        self.timer?.invalidate()
    }

    func cb(){
        self.count++
        print(self.count)
        if self.count == self.sec {
            self.stop()
        }
    }
}
