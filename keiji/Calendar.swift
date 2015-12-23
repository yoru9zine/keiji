//
//  Calendar.swift
//  keiji
//
//  Created by yoru9zine on 12/25/15.
//  Copyright © 2015 yoru9zine. All rights reserved.
//

import Foundation
import EventKit

class Calendar {
    let eventStore:EKEventStore
    init(){
        eventStore = EKEventStore()
    }
    func requestAuthz(){
        eventStore.requestAccessToEntityType(EKEntityType.Event, completion: {
            (granted , error) -> Void in
            if granted {
                return
            }
            else {
                print("not granted")
            }
        })
    }

    func authorize() -> Bool{
        let status = EKEventStore.authorizationStatusForEntityType(EKEntityType.Event)
        switch(status){
        case EKAuthorizationStatus.NotDetermined:
            return false
        case EKAuthorizationStatus.Authorized:
            self.requestAuthz()
            return true
        case EKAuthorizationStatus.Restricted, EKAuthorizationStatus.Denied:
            return false
        }
    }

    func getCalendar() ->EKCalendar{
        for c in eventStore.calendarsForEntityType(EKEntityType.Event){
            if c.title == "keiji" {
                return c
            }
        }
        let cal = EKCalendar(forEntityType: EKEntityType.Event, eventStore: eventStore)
        cal.title = "keiji"
        for s in eventStore.sources{
            if s.sourceType == EKSourceType.Local {
                cal.source = s
                break
            }
        }
        try! eventStore.saveCalendar(cal, commit: true)
        return cal
    }

    func addEvent(start:NSDate, end:NSDate){
        let cal = self.getCalendar()
        let event = EKEvent(eventStore:eventStore)
        event.title = "hogehoge"
        event.startDate = start
        event.endDate = end
        event.notes = "This is a note"
        event.calendar = cal
        print(event)
        
        try! eventStore.saveEvent(event, span: EKSpan.ThisEvent, commit: true)
    }
}
