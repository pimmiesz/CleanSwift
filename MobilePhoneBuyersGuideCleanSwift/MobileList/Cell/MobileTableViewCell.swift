//
//  MobileTableViewCell.swift
//  MobilePhoneBuyersGuide
//
//  Created by Patchariya Piyaaromrat on 27/8/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import UIKit

class MobileTableViewCell: UITableViewCell {
  
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var img: UIImageView!
  @IBOutlet weak var starBtn: UIButton!
  var vc: MobileListViewControllerInterface?
  var isTapped: Bool = false
  
  
  @IBAction func tap(_ sender: UIButton) {
    isTapped = !isTapped
    vc?.addFavorite(cell: self)
    
  }
  func setImageButton (isFav: Bool) {
    let imageStar: UIImage?
    if isFav {
      isTapped = isFav
      imageStar = UIImage(named: "star-tap.png")
    } else {
      isTapped = isFav
      imageStar = UIImage(named: "star.png")
    }
    if let imageStar = imageStar {
      starBtn.setImage(imageStar, for: .normal)
    }
  }
  
  func hiddenStar(isHidden: Bool){
    starBtn.isHidden = isHidden
  }
}
