//
//  MyCollectionViewCell.swift
//  TestCollectionView
//
//  Created by KJEM on 07/12/2019.
//  Copyright © 2019 KJEM. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myCellLabel: UILabel!
    
    override func awakeFromNib() {
        myCellLabel.backgroundColor = .red
    }
}
