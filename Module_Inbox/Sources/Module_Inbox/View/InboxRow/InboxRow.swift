//
//  InboxRow.swift
//  
//
//  Created by polykuzin on 23/09/2022.
//

import UIKit

class InboxRow : UITableViewCell {
    
    var isCompleted : Bool!
    
    @IBOutlet private var title : UILabel!
    
    @IBOutlet private var checkbox : UIImageView!
    
    public func configure(with data: _InboxRow) {
        isCompleted = data.complete
    }
}
