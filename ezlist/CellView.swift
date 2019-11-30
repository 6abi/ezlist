//
//  CellView.swift
//  ezlist
//
//  Created by Apple Developer Academy on 30/11/19.
//  Copyright © 2019 Apple Developer Academy. All rights reserved.
//

import SwiftUI
import UIKit

class CellView: UICollectionViewCell {
    
    @IBOutlet weak var lbl: UILabel!
    
    
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
    }
    
    public func configure(with text: String){
        
        self.lbl.text = text
        self.lbl.textColor = .black
        self.backgroundColor = .lightGray
    }
}
