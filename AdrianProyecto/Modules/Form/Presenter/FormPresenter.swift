//
//  FormPresenter.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 2/2/22.
//

import Foundation

class FormPresenter: FormPresenterContract {
    var view: FormViewContract?
    var interactor: FormInteractorContract?
    
    func didPressSend() {
        //validacion de formulario
     //   interactor?.saveForm(formModel: FormModel)
    }
    
    
}
