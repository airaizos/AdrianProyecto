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
    
    private var formModel = FormModel(cif: nil, companyName: nil, address: nil, countryCheckDigits: nil, bank: nil, bankOffice: nil, accountCheckDigits: nil, account: nil, phone: nil, email: nil)
    
    func didPressSend() {
        view?.showValidationError()
        
        //     interactor?.saveForm(formModel: FormModel)
    }
    
    
    
    
}

//Validaciones
extension FormPresenter {
    
    func didUpdateCif(_ cif: String?) {
        formModel.cif = cif
        view?.didValidateCif(formModel.isValidCif)
    }
    
    func didUpdateCompanyName(_ companyName: String?) {
        formModel.companyName = companyName
        view?.didValidateCompanyName(formModel.isValidCompanyName)
    }
    
    func didUpdateAddress(_ address: String?) {
        formModel.address = address
        view?.didValidateAddress(formModel.isValidAddress)
    }
    
    func didUpdateCountryCheckDigits(_ countryCheckDigits: String?) {
        formModel.countryCheckDigits = countryCheckDigits
        view?.didValidateCountryCheckDigits(formModel.isValidCountryCheckDigits)
    }
    
    func didUpdateBank(_ bank: String?) {
        formModel.bank = bank
        view?.didValidateBank(formModel.isValidBank)
    }
    
    func didUpdateBankOffice(_ bankOffice: String?) {
        formModel.bankOffice = bankOffice
        view?.didValidateBankOffice(formModel.isValidBankOffice)
    }
    
    func didUpdateAccountCheckDigits(_ accountCheckDigits: String?) {
        formModel.accountCheckDigits = accountCheckDigits
        view?.didValidateAccount(formModel.isValidAccountCheckDigits)
    }
    
    func didUpdateAccount(_ account: String?) {
        formModel.account = account
        view?.didValidateAccount(formModel.isValidAccount)
    }
    
    func didUpdatePhone(_ phone: String?) {
        formModel.phone = phone
        view?.didValidatePhone(formModel.isValidPhone)
    }
    
    func didUpdateEmail(_ email: String?) {
        formModel.email = email
        view?.didValidatePhone(formModel.isValidEmail)
    }
    
}
