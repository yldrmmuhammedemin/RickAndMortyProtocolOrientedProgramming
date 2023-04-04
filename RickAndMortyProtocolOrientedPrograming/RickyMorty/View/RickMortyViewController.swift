//
//  ViewController.swift
//  RickAndMortyProtocolOrientedPrograming
//
//  Created by Yildirim on 4.04.2023.
//

import UIKit
import SnapKit

final class RickyMortyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureComponent()
        configureConstraint()
    }
    
    
    private let labelTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let boxView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let indicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    private func configureComponent(){
        view.addSubview(labelTitle)
        view.addSubview(boxView)
        view.addSubview(indicator)
    }
    
    private func configureConstraint(){
        makeBox()
        makeLabel()
        makeIndicator()
    }
    
    private func generalConfigure(){
        view.backgroundColor = .red
        indicator.color = .red
        indicator.startAnimating()
    }
    
}

extension RickyMortyViewController{
    
    private func makeBox(){
        boxView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
    
    private func makeLabel(){
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeIndicator(){
        indicator.snp.makeConstraints { make in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
}

