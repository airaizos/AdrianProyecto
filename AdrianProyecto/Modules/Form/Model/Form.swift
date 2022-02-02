//
//  Form.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 2/2/22.
//

import Foundation

struct FormModel: Codable {
    
    var cif: String
    var companyName: String
    var address: String
    var countryCheckDigits: Int
    var bank: Int
    var bankOffice: Int
    var accountCheckDigits: Int
    var account: Int
    var phone: String
    var email: String
    
}


//Validaciones

