//
//  DetailViewModel.swift
//  App
//
//   var back: (() -> Void)?

import Foundation

class DetailViewModel {
    var back: (() -> Void)?
    
    var forecastItem: ForecastItem
    
    init(forecastItem: ForecastItem) {
        self.forecastItem = forecastItem
    }

}
