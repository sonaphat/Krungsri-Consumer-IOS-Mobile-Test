//
//  ForcastTableViewCell.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 13/2/2566 BE.
//

import Foundation
import UIKit
import SwiftDate
import Kingfisher

class ForcastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    func setupCell(weather: ForcastListModel) {
        dateLabel.text = "\(Date(timeIntervalSince1970: weather.date).toFormat("YYYY-MMM-dd HH:mm"))"
        tempLabel.text = "\(weather.main?.temp ?? 0.0)"
        weatherLabel.text = "\(weather.weater.first?.main ?? "-")"
        iconImageView.kf.setImage(with: URL(string: "https://openweathermap.org/img/w/\(weather.weater.first?.icon ?? "").png"))

        
    }
}
