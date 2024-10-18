//
//  Teams.swift
//  sofascore
//
//  Created by Thales Brederodes Montarroyos Candido on 22/11/23.
//

import Foundation



struct Team{
    let id: TeamType
    let name:String
    let info:String
    let manager: Manager
    let founded:String
    var isPlaying: Bool = false
   
}
