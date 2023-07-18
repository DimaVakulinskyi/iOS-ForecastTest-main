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
    private var detailView: DetailView!

    public init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = GlobalColor.backgroundColor

        detailView = DetailView()
        detailView.center = self.view.center
        view.addSubview(detailView)
        load()
    }

    private func load() {
        detailView.configure(with: viewModel.forecastItem)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.back?()
    }
}
