//
//  Manager.swift
//  sofascore
//
//  Created by Thales Brederodes Montarroyos Candido on 22/11/23.
//

import Foundation

enum JobType:String{
    case manager = "Manager"
    case headCoach = "Head Coach"
}

struct Manager{
    let name:String
    let job:JobType
}
