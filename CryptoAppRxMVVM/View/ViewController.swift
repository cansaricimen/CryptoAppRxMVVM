//
//  ViewController.swift
//  CryptoAppRxMVVM
//
//  Created by MUSTACIC on 28.12.2023.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    let disposebag = DisposeBag()
    let cryptoVM = CryptoViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        tableView.rx.setDelegate(self).disposed(by: disposebag)
        
        setupBindings()
        cryptoVM.requestData()
    }
    
    private func setupBindings(){
        
        cryptoVM
            .loading
            .bind(to: indicatorView.rx.isAnimating)
            .disposed(by: disposebag)
        
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
                print(error)
            }
            .disposed(by: disposebag)
        
        cryptoVM
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .bind(to: tableView.rx.items(cellIdentifier: "CryptoCell",cellType: CryptoTableViewCell.self)) {row,item,cell in
                cell.item = item
                
            }.disposed(by: disposebag)
        
    }
    



}

