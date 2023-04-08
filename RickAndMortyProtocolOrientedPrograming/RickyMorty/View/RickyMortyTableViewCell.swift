//
//  RickyMortyTableViewCell.swift
//  RickAndMortyProtocolOrientedPrograming
//
//  Created by Yildirim on 5.04.2023.
//

import UIKit
import SnapKit

class RickyMortyTableViewCell: UITableViewCell {

    static let identifier = "RickyMortyTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(labelView)
        contentView.addSubview(indicatorView)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let labelView : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
            
    }()
    
    private let indicatorView : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private func configurationConstraint(){
    
    }
    

}
