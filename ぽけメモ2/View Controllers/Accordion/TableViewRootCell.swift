//
//  TableViewRootCell.swift
//  AnimatedReloadingTableViewExp
//
//  Created by Takeshi Tanaka on 10/31/15.
//  Copyright © 2015 p0dee. All rights reserved.
//

import UIKit

class TableViewRootCell: UITableViewCell {
    
    var initialHeight: CGFloat = 60.0
    fileprivate var scale: CGFloat = 1.0
    fileprivate let cross = UIImageView()
    let label = UILabel()
    
    var extended: Bool {
        didSet {
            let angle: CGFloat = self.extended ? CGFloat(M_PI * 45 / 180) : 0
            let t = CGAffineTransformExtractScale(cross.transform)
            cross.transform = t.rotated(by: angle)
        }
    }
    
    override var frame: CGRect {
        didSet {
            scale = self.frame.size.height / initialHeight
            label.transform = CGAffineTransform(scaleX: scale, y: scale)
            let t = CGAffineTransformExtractRotation(cross.transform)
            cross.transform = t.scaledBy(x: scale, y: scale)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        extended = false
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        extended = false
        super.init(coder: aDecoder)
        self.setupViews()
        self.setupConstraints()
    }
    
    fileprivate func setupViews() {
        cross.translatesAutoresizingMaskIntoConstraints = false
        cross.image = UIImage(named: "cross")
        self.contentView.addSubview(cross)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        self.contentView.addSubview(label)
    }
    
    fileprivate func setupConstraints() {
        let triangleLeading = NSLayoutConstraint(item: cross, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0)
        let triangleCenterY = NSLayoutConstraint(item: cross, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let labelCenterX = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let labelCenterY = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        NSLayoutConstraint.activate([triangleLeading, triangleCenterY, labelCenterX, labelCenterY])
    }
}
