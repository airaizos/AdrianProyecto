//
//  FetchAnimalsUseCase.swift
//  AnimalesDelMundo
//
//  Created by Adrian Iraizos Mendoza on 23/1/22.
//

import Foundation
import Alamofire

protocol FetchAnimalsUseCase {
    func fetchAnimals(completion: @escaping ([Animal]) -> Void)
}

class FetchAnimalsFromAPI: FetchAnimalsUseCase {
    
    func fetchAnimalsAF(completion: @escaping ([Animal]) -> Void) {
        
        guard let url = URL(string:"https://zoo-animal-api.herokuapp.com/animals/rand/10") else {
            completion([])
            return
        }
        let request = URLRequest(url: url)
        
        AF.request(request).responseDecodable { (response: DataResponse<[Animal],AFError>) in
            switch response.result {
            case .success(let animals): completion(animals)
            case .failure: completion([])
            }
        }.validate()
    }
    
    //no carga por alamofire

    func fetchAnimals(completion: @escaping ([Animal]) -> Void) {
        print("aqui")
        guard let url = URL(string:"https://zoo-animal-api.herokuapp.com/animals/rand/10") else {
            completion([])
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { completion([])
                return
            }
            do {
                let animals = try JSONDecoder().decode([Animal].self, from: data)
                completion(animals)
            } catch {
                completion([])
            }
        }.resume()
        
    }
}

//MARK: Leer del disco Prueba

class FetchAnimalFromDisk {
    private let bundle: Bundle
    private let resourceName: String
    private let decoder: JSONDecoder
    
    init(bundle: Bundle = .main, resourceName: String = "animalData.json", decoder: JSONDecoder = .init()) {
        self.bundle = bundle
        self.resourceName = resourceName
        self.decoder = decoder
    }
}


extension FetchAnimalFromDisk {

    func fetchAnimalsFD(completion: @escaping (Result<[Animal],FetchAnimalError>) -> ()) {
        guard let file = bundle.url(forResource: resourceName, withExtension: nil) else {
            completion(.failure(.unableToFindFile))
            return
        }
        do {
            let data = try Data(contentsOf: file)
            let animals = try decoder.decode([Animal].self, from: data)
            completion(.success(animals))
        } catch {
            completion(.failure(.parseError(error)))
        }
    }
    

    
}

enum FetchAnimalError: Error {
    case unableToFindFile, parseError(Error?)
}
