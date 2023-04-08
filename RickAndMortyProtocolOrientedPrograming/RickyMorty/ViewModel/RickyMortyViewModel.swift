//
//  RickyMortyViewModel.swift
//  RickAndMortyProtocolOrientedPrograming
//
//  Created by Yildirim on 7.04.2023.
//

import Foundation

protocol IRickyMortyViewModel{
    func fetchItems()
    func changeLoading()
    var rickyMortyCharacters: [Result] {get set}
    var rickyMortyService: IRickyMortyService {get}
    var rickyMortyVC: IRickyMortyViewController? {get}
    func setDelegate(output: IRickyMortyViewController )
}

class RickyMortyViewModel:IRickyMortyViewModel{
    func setDelegate(output: IRickyMortyViewController) {
        rickyMortyVC = output
    }
    
    var rickyMortyVC: IRickyMortyViewController?
    
    init(){
        rickyMortyService = RickyMortyService()
    }
    
    func fetchItems() {
        changeLoading()
        rickyMortyService.fetchAllDatas { [weak self] response in
            self?.changeLoading()
            self?.rickyMortyCharacters = response ?? []
            self?.rickyMortyVC?.saveData(values: self?.rickyMortyCharacters ?? [])
        }
    }
    
    func changeLoading() {
        isChangeLoading = !isChangeLoading
        rickyMortyVC?.chanceLoading(isLoad: isChangeLoading)
    }
    
    var rickyMortyCharacters: [Result] = []
    
    var rickyMortyService: IRickyMortyService
    
    private var isChangeLoading = false
    
    
}
