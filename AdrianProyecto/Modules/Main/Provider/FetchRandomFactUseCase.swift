//
//  FetchRandomFactUseCase.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
// TODO: Mark este no se está usando. Diferencias entre UseCases y providers

import Foundation
import Alamofire

protocol FetchRandomFactUseCase {
    func fetchRandomFact(completion: @escaping ([Fact]) -> Void)
}

class FetchRandomFactFromAPI: FetchRandomFactUseCase
{
    func fetchRandomFact(completion: @escaping ([Fact]) -> Void) {
        
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            completion([])
            return
        }
        
        let request = URLRequest(url: url)
        
        AF.request(request).responseDecodable {
            (response: DataResponse<[Fact],AFError>) in
            
            switch response.result {
            case .failure: completion([])
            case .success(let facts): completion(facts)
            }
        }.validate()
    }
}
