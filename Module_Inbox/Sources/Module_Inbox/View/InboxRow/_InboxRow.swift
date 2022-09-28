//
//  _InboxRow.swift
//  
//
//  Created by polykuzin on 23/09/2022.
//

import Foundation

protocol _InboxRow {
    var title : String { get }
    var color : String { get }
    var isComplete : Bool { get }
    var onComplete : (() -> Void) { get }
    var onCellSelect : (() -> Void) { get }
}
