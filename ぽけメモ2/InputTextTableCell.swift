//
//  InputTextTableCell.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/01/21.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

protocol InputTextTableCellDelegate {
    func textFieldDidEndEditing(cell: InputTextTableCell, value: NSString) -> ()
}

class InputTextTableCell: UITableViewCell, UITextFieldDelegate{
    var delegate: InputTextTableCellDelegate! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func height() -> CGFloat {
        return 75.0
    }
    
    // MARK: - UITextFieldDelegate
    internal func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    internal func textFieldDidEndEditing(textField: UITextField) {
        self.delegate.textFieldDidEndEditing(self, value: textField.text!)
    }
}

