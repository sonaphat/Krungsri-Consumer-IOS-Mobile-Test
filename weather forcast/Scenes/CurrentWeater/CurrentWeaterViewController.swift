//
//  CurrentWeaterViewController.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import RxSwift
import RxCocoa

protocol CurrentWeaterDisplayLogic: NSObjectProtocol {
    func displayCurrentWeather(viewModel: CurrentWeater.requestCurrentWeater.ViewModel)
    func displayForcastWeather(viewModel: CurrentWeater.requestForcastWeater.ViewModel)
    func errorHandler(viewModel: CurrentWeater.ErrorHandler.ViewModel)
}

class CurrentWeaterViewController: BaseViewController {
    // MARK: Class Propoties
    var interactor: CurrentWeaterBusinessLogic?
    var router: (NSObjectProtocol & CurrentWeaterRoutingLogic & CurrentWeaterDataPassing)?
    
    // MARK: IBOutlet
    @IBOutlet weak var cityNameTextfield: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    
    @IBOutlet weak var tempResultView: UIView!
    @IBOutlet weak var tempValueLabel: UILabel!
    @IBOutlet weak var tempMaxValueLabel: UILabel!
    @IBOutlet weak var tempMinValueLabel: UILabel!
    @IBOutlet weak var tempFeelLikeValueLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    // MARK: Valuable Propoties
    let disposeBag = DisposeBag()
    var cityName: String = ""
    var isMatric: Bool = true
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRxObserver()
        tempResultView.isHidden = true
        convertButton.isHidden = true
        cityNameTextfield.becomeFirstResponder()
    }
    
    // MARK: Functions
    func setupRxObserver() {
        
        cityNameTextfield
            .rx
            .controlEvent(.editingDidEndOnExit)
            .throttle(.milliseconds(100), scheduler: MainScheduler.instance)
            .subscribe { [weak self] _ in
                guard let self = self else { return }
                self.tempResultView.isHidden = true
                self.convertButton.isHidden = true
                self.interactor?.requestCurrentWeather(request: CurrentWeater.requestCurrentWeater.Request(cityName: self.cityName,
                                                                                                           isMatric: self.isMatric))
            }.disposed(by: disposeBag)
        
        cityNameTextfield
            .rx
            .text
            .orEmpty
            .observe(on: MainScheduler.asyncInstance)
            .throttle(.milliseconds(100), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] string in
                guard let self = self else { return }
                self.cityName = string
            }).disposed(by: disposeBag)
    }
    
    // MARK: IBAction
    @IBAction func onTapForcast(_ sender: UIButton) {
        self.interactor?.requestForcastWeather(request: CurrentWeater.requestForcastWeater.Request(cityName: self.cityName,
                                                                                                   isMatric: self.isMatric))
    }
    
    @IBAction func onConvert(_ sender: UIButton) {
        isMatric = !isMatric
        self.interactor?.requestCurrentWeather(request: CurrentWeater.requestCurrentWeater.Request(cityName: self.cityName,
                                                                                                   isMatric: self.isMatric))
    }
}

extension CurrentWeaterViewController: CurrentWeaterDisplayLogic {
    
    func displayCurrentWeather(viewModel: CurrentWeater.requestCurrentWeater.ViewModel) {
        tempResultView.isHidden = false
        convertButton.isHidden = false
        
        tempValueLabel.text = "\(viewModel.current?.main?.temp ?? 0.0)"
        tempMaxValueLabel.text = "\(viewModel.current?.main?.temp_max ?? 0.0)"
        tempMinValueLabel.text = "\(viewModel.current?.main?.temp_min ?? 0.0)"
        tempFeelLikeValueLabel.text = "\(viewModel.current?.main?.feels_like ?? 0.0)"
        humidityValueLabel.text = "\(viewModel.current?.main?.humidity ?? 0.0)"
        iconImageView.kf.setImage(with: URL(string: "https://openweathermap.org/img/w/\(viewModel.current?.weater.first?.icon ?? "").png"))
    }
    
    func displayForcastWeather(viewModel: CurrentWeater.requestForcastWeater.ViewModel) {
        self.router?.routerToForcast(list: viewModel.list)
    }
    
    func errorHandler(viewModel: CurrentWeater.ErrorHandler.ViewModel) {
        let alert = UIAlertController(title: viewModel.errorTitleMessage,
                                      message: viewModel.errorDescMessage,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
