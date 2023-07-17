//
//  ForecastItemData.swift
//  App
//
//  Created by Дмитро Вакулінський on 17.07.2023.
//

import UIKit
import Global
import GlobalUI

class ForecastItemData: TableViewData {
    
    var forecastItem: ForecastItem

    init(forecastItem: ForecastItem) {
        self.forecastItem = forecastItem
        super.init()
    }

    override var cellType: TableViewCell.Type? {
        return ListCell.self
    }

    override func isEqual(to other: TableViewData) -> Bool {
        guard let otherItem = other as? ForecastItemData else { return false }
        return forecastItem.day == otherItem.forecastItem.day    }

    override func hash(into hasher: inout Hasher) {
        hasher.combine(forecastItem.day)
    }
}
