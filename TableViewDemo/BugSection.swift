//
//  BugSection.swift
//  TableViewDemo
//
//  Created by VKS on 3/21/16.
//  Copyright © 2016 VKS. All rights reserved.
//

import Foundation

class BugSection{
    let howScary:ScaryFactor
    var bugs = [ScaryBug]()
    init(howScary: ScaryFactor){
    self.howScary = howScary
    }
}