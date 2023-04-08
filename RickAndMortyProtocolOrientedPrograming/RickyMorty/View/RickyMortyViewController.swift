//
//  ViewController.swift
//  RickAndMortyProtocolOrientedPrograming
//
//  Created by Yildirim on 4.04.2023.
//

import UIKit
import SnapKit

protocol IRickyMortyViewController{
    func chanceLoading(isLoad: Bool)
    func saveData(values: [Result])
}

 final class RickyMortyViewController: UIViewController {

     // MARK: - Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureComponent()
        configureConstraint()
        generalConfigure()
        delegateStuff()
    }
    
     // MARK: - Variables and Components
    private lazy var results: [Result] = []
     lazy var rickyMortyViewModel:IRickyMortyViewModel = RickyMortyViewModel()
    
    
     
    private let labelTitle : UILabel = {
        let label = UILabel()
        label.text = "Rick And Morty Characters"
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let boxView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     private let tableView: UITableView = {
         let tableView = UITableView()
//         tableView.register(RickyMortyTableViewCell.self,
//                            forCellReuseIdentifier: RickyMortyTableViewCell.identifier)
         return tableView
     }()
     
    private let indicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
     // MARK: - Add Subview Function    
    private func configureComponent(){
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
    }
     // MARK: - Constraint Set Function
    private func configureConstraint(){
        makeBox()
        makeLabel()
        makeIndicator()
    }
     // MARK: - General Configure Function
    private func generalConfigure(){
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.indicator.color = .red
            self.indicator.startAnimating()
        }

    }
     // MARK: - Table View Delegate
     private func delegateStuff(){
         tableView.delegate = self
         tableView.dataSource = self
         rickyMortyViewModel.setDelegate(output: self)
         rickyMortyViewModel.fetchItems()
     }
    
}
// MARK: - SnapKit Constraint Set
extension RickyMortyViewController{
    
    private func makeBox(){
        tableView.snp.makeConstraints { make in
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
// MARK: - Protocol Stuff
extension RickyMortyViewController: IRickyMortyViewController{
    func chanceLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveData(values: [Result]) {
        results = values
        tableView.reloadData()
    }
    
    
}
// MARK: - TableView required functions
extension RickyMortyViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: RickyMortyTableViewCell.identifier, for: indexPath) as? RickyMortyTableViewCell else{
//            return UITableViewCell()
//        }
//        return cell
        let cell = UITableViewCell()
        cell.textLabel?.text = results[indexPath.row].name ?? ""
        return cell
    }
    

    
    
}

