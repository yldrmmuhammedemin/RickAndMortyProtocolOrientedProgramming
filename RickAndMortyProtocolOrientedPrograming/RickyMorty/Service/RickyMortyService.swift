//
//  RickyMortyService.swift
//  RickAndMortyProtocolOrientedPrograming
//
//  Created by Yildirim on 5.04.2023.
//

import Alamofire
import Foundation



protocol IRickyMortyService{
    func fetchAllDatas(response: @escaping ([Result]?) -> Void  )
    
}


struct RickyMortyService:IRickyMortyService{
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(RickyMortyServiceEndpoint.characterPath()).responseDecodable(of: PostModel.self) { model in
            guard let data = model.value else{
                response(nil)
                return
            }
            response(data.results)  
        }
    }
    
    
}
