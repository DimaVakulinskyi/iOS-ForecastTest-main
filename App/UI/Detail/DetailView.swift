//
//  DetailView.swift
//  App
//
//

import UIKit

class DetailView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let highLowLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let sunriseSunsetLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let chanceRainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(imageView)
        addSubview(descriptionLabel)
        addSubview(highLowLabel)
        addSubview(sunriseSunsetLabel)
        addSubview(chanceRainLabel)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),

            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            highLowLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            highLowLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            sunriseSunsetLabel.topAnchor.constraint(equalTo: highLowLabel.bottomAnchor, constant: 10),
            sunriseSunsetLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            chanceRainLabel.topAnchor.constraint(equalTo: sunriseSunsetLabel.bottomAnchor, constant: 10),
            chanceRainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

    func configure(with forecastItem: ForecastItem) {
        imageView.image = UIImage(named: forecastItem.type)
        descriptionLabel.text = forecastItem.description
        highLowLabel.text = "High: \(forecastItem.high)°, Low: \(forecastItem.low)°"
        sunriseSunsetLabel.text = "Sunrise: \(forecastItem.sunrise), Sunset: \(forecastItem.sunset)"
        chanceRainLabel.text = "Chance of Rain: \(forecastItem.chanceRain)%"
    }
}


