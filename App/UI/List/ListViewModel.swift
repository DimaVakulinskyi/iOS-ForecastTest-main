//
//  ListViewModel.swift
//  App
//
//

import Global
import GlobalUI
import Combine

class ListViewModel {
    @Inject var service: ForecastService
    private var bag = Set<AnyCancellable>()

    var items: [ForecastItem] = []

    var showDetail: ((ForecastItem) -> Void)?

    var title: String = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as! String

    init() {
        service.items
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.items = $0 }
            .store(in: &bag)
    }  
}
