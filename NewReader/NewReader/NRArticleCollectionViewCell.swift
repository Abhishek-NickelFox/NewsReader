//
//  NRArticleCollectionViewCell.swift
//  NewReader
//
//  Created by Abhishek Thapliyal on 1/24/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

/************************************************************************************************************
 NRArticleCollectionViewCell : THIS IS EXTENDED CLASS OF COLLECTION VIEW CELL
                               FOR ARTICLE CELL IN NRArticlesVC
 ************************************************************************************************************/

import UIKit

class NRArticleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
}
