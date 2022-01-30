//
//  MainPresenter.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 30/1/22.
//

import Foundation

struct FactViewModel {
    let iconURL: URL?
    let value: String
}

class MainPresenter: MainPresenterContract {
    
    weak var view: MainViewContract?
    var interactor: MainInteractorContract?
    var wireframe: WireframeInteractorContract?
    
    func factViewModel() -> FactViewModel {
        let fact = item

        return fact.toMainFactViewModel
       
    }
    
    private var item:Fact = Fact(iconURL: nil, value: "")
    
    func viewDidLoad() {
        interactor?.output = self

    }
}

extension MainPresenter: MainInteractorOutputContract {
    func didFetch(fact: Fact) {
        self.item = fact
    }
    
    func didFetchFail() {
        
    }
}
