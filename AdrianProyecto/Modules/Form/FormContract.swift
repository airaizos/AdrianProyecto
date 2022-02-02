//
//  FormContract.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 2/2/22.
//

import Foundation

protocol FormViewContract {
    var presenter: FormPresenterContract? { get set }
    
}

protocol FormPresenterContract {
    var view: FormViewContract? { get set }
    func didPressSend()
}

protocol FormInteractorContract {
    
    func saveForm(formModel: FormModel)
}

protocol FormProviderContract {
    
    func saveForm(_ form: FormModel)
    
    func loadForm(_ completion: @escaping (FormModel?) -> ())
    
}
