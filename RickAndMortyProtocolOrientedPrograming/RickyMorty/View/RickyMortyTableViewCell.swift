//
//  RickyMortyTableViewCell.swift
//  RickAndMortyProtocolOrientedPrograming
//
//  Created by Yildirim on 5.04.2023.
//

import UIKit
import SnapKit
import SDWebImage
class RickyMortyTableViewCell: UITableViewCell {
    // MARK: - Table View Cell Identifier
    static let identifier = "RickyMortyTableViewCell"
    
    // MARK: - Variables
    private let characterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let characterName : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init functions
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(characterImageView)
        contentView.addSubview(characterName)
        configurationConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Configure Functions
    
    private func configurationConstraint(){
        characterName.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.top.equalTo(contentView).offset(5)
            make.height.equalTo(30)
        }
        
        characterImageView.snp.makeConstraints { make in
            make.top.equalTo(characterName).offset(30)
            make.left.equalTo(characterName)
            make.bottom.equalTo(contentView)
            make.right.equalTo(contentView).offset(-10)
            
        }
    }
    
    public func setDetails(model: Result){
        characterName.text = model.name
        characterImageView.sd_setImage(with: URL(string:model.image ?? Const.noImageUrl) ?? URL(string: Const.noImageUrl))
    }

}
