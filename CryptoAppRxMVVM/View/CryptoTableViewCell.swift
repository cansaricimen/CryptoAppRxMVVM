//
//  CryptoTableViewCell.swift
//  CryptoAppRxMVVM
//
//  Created by MUSTACIC on 28.12.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public var item : Crypto! {
        
        didSet {
            self.currencyLabel.text = item.currency
            self.priceLabel.text = item.price
        }
        
    }

}
