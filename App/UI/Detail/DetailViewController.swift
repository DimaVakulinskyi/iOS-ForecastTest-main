//
//  DetailViewController.swift
//  App
//
//

import UIKit
import Combine
import GlobalUI

class DetailViewController: UIViewController {

    private var viewModel: DetailViewModel

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

    public init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = GlobalColor.backgroundColor

        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
        view.addSubview(highLowLabel)
        view.addSubview(sunriseSunsetLabel)
        view.addSubview(chanceRainLabel)

        setupLayout()
        load()
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),

            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            highLowLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            highLowLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            sunriseSunsetLabel.topAnchor.constraint(equalTo: highLowLabel.bottomAnchor, constant: 10),
            sunriseSunsetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            chanceRainLabel.topAnchor.constraint(equalTo: sunriseSunsetLabel.bottomAnchor, constant: 10),
            chanceRainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    private func load() {
        imageView.image = UIImage(named: viewModel.forecastItem.type)
        descriptionLabel.text = viewModel.forecastItem.description
        highLowLabel.text = "High: \(viewModel.forecastItem.high)°, Low: \(viewModel.forecastItem.low)°"
        sunriseSunsetLabel.text = "Sunrise: \(viewModel.forecastItem.sunrise), Sunset: \(viewModel.forecastItem.sunset)"
        chanceRainLabel.text = "Chance of Rain: \(viewModel.forecastItem.chanceRain)%"
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.back?()
    }
}
