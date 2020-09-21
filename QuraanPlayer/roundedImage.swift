//
//  roundedImage.swift
//  QuraanPlayer
//
//  Created by adol kazmy on 24/03/2020.
//  Copyright © 2020 Adel Kazme. All rights reserved.
//

import UIKit


class image : UIImageView {
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
    }
    
}
