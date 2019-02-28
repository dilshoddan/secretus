//
//  ShadowView.swift
//  secretus
//
//  Created by Home on 2/28/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }

}
