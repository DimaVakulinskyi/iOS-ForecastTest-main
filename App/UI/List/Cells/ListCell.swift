//
//  ListCell.swift
//  App
//
//

import GlobalUI
import UIKit

class ListCell: TableViewCell {
    private let dayLabel = UILabel.useConstraint
    private let descriptionLabel = UILabel.useConstraint
    
    override func addSubviews() {
        super.addSubviews()
        contentView.add(subviews: dayLabel, descriptionLabel)
    }
    
    override func configure() {
        super.configure()
        dayLabel.textColor = .white
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            dayLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    override func load(data: TableViewData) {
        super.load(data: data)
        
        if let forecastData = data as? ForecastItemData {
            dayLabel.text = forecastData.forecastItem.day
            descriptionLabel.text = forecastData.forecastItem.description
        }
    }
}
