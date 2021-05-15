//
//  PaymentSelectionTableViewCell.swift
//  PaymentDemo
//
//  Created by Abhyankar Bhushan on 09/05/21.
//

import UIKit

class PaymentSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewPaymentLogo: UIImageView!
    @IBOutlet weak var labelPaymentTitile: UILabel!
    
    @IBOutlet weak var buttonRadioSelection: UIButton!
    var applicableNetwork : ApplicableNetwork? {
        didSet {
            
            guard let applicableNetwork = applicableNetwork else {
                return
            }
            
            labelPaymentTitile?.text = applicableNetwork.label
            guard let logoURL = applicableNetwork.links?.logo else { return  }
            imageViewPaymentLogo?.imageFromURL(urlString:  logoURL, PlaceHolderImage: UIImage.init(named: "paymentplaceholder")!)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        buttonRadioSelection.isSelected = selected
        // Configure the view for the selected state
    }

}

