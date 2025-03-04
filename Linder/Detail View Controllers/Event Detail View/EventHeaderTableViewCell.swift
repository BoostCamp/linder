//
//  EventHeaderTableViewCell.swift
//  Lindar
//
//  Created by 박종훈 on 2017. 2. 11..
//  Copyright © 2017년 Hidden Track. All rights reserved.
//

import UIKit
import Nuke

let EventHeaderTableViewCellHeight: CGFloat = 170

class EventHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var location: UILabel!
    
    private var _event: Event?
    var event: Event? {
        get {
            return _event
        }
        set (new) {
            // 이미지 경로
            if let url =  new?.thumbnailURL {
                Nuke.loadImage(with: url, into: thumbnailView!)
            }
            else {
                self.thumbnailView.image = #imageLiteral(resourceName: "323x63_kakao")
            }
            
            self.titleView.text = new?.title
            self.startDate.text = new?.startedAt?.toDateString()
            self.endDate.text = new?.endedAt?.toDateString()
            if let locationList = new?.locations {
                self.location.text = String(locationList: locationList)
            }
            self._event = new
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
