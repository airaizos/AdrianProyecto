//
//  ListadoProvider.swift
//  CursoiOS-Proyecto1
//
//  Created by Adrian Iraizos Mendoza on 27/1/22.
//

import Foundation
import Alamofire

class NetworkListadoProvider: ListadoProviderContract {
    
    func getAnimalListado(_ completion: @escaping (Result<[Animal], ListadoProviderError>) -> Void) {
        guard let url = URL(string: "https://zoo-animal-api.herokuapp.com/animals/rand/10") else {
            completion(.failure(.badUrl))
            return
        }
        
        let request = URLRequest(url: url)
        AF.request(request).responseDecodable { (response: DataResponse<[Animal],AFError>) in
            switch response.result {
            case .success(let animales): completion(.success(animales))
            case .failure(let error): completion(.failure(.generic(error)))
            }
        }.validate()
    }
}
