//
//  MainProvider.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 30/1/22.
//

import Foundation
import Alamofire

class FactProviderFromAPI: MainProviderContract {
  
    func getMainFact(_ completion: @escaping (Result<Fact, MainProviderError>) -> ()) {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            completion(.failure(.badURL))
            return
        }
        let request = URLRequest(url: url)
        AF.request(request).responseDecodable { [weak self](response: DataResponse<Fact,AFError>) in
            switch response.result {
            case .success(let fact): completion(.success(fact))
            case .failure(let error): completion(.failure(.generic(error)))
            }
        }.validate()
    }
}



