//
//  InputTextTableCell.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/01/21.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

protocol InputTextTableCellDelegate {
    func textFieldDidEndEditing(_ cell: InputTextTableCell, value: NSString) -> ()
}

class InputTextTableCell: UITableViewCell, UITextFieldDelegate{
    var delegate: InputTextTableCellDelegate! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func height() -> CGFloat {
        return 75.0
    }
    
    // MARK: - UITextFieldDelegate
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate.textFieldDidEndEditing(self, value: textField.text! as NSString)
    }
}

