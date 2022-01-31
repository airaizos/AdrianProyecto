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

class MainPresenter: MainPresenterContract, MainInteractorOutputContract {
    
    weak var view: MainViewContract?
    var interactor: MainInteractorContract?
    var wireframe: MainWireframeContract?
    var fetchFacts: MainProviderContract?
    
    var fact:Fact = Fact(iconURL: URL(string: "https://api.chucknorris.io/img/chucknorris_logo_coloured_small@2x.png"), value: "Init vacio")
    
    func viewDidLoad() {
        interactor?.output  = self
        interactor?.fetchItems()
      
    }
    func didFetch(fact: Fact) {
        self.fact = fact
        //aqui lo tengo los datos del api
        view?.configure(with: fact.toMainFactViewModel)
}

    func didFetchFail() {
        self.fact = Fact(iconURL: URL(string: "error"), value: "error")
    }
}
