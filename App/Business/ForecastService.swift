//
//  ForecastService.swift
//  App
//
//

import Combine
import Global

protocol ForecastServiceProtocol {
    var items: CurrentValueSubject<ForecastItems, Never> { get }
    var forecastNetworkService: ForecastNetworkService { get }
}

class ForecastService: ForecastServiceProtocol {
    var items: CurrentValueSubject<ForecastItems, Never> = CurrentValueSubject([])
    @Inject var forecastNetworkService: ForecastNetworkService
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        forecastNetworkService.getForecast()
            .map() { forecastItems -> ForecastItems in
                forecastItems.map { ForecastItem(dto: $0) }
            }
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        print(error.localizedDescription)
                    default:
                        break
                }
            } receiveValue: {[weak self] forecastItems in
                guard let self = self else { return }
                self.items.send(forecastItems)
            }
            .store(in: &bag)
    }
    
}
