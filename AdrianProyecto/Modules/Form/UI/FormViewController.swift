//
//  FormViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import UIKit

class FormViewController: UIViewController {
    
    //MARK: Oulets
    
    @IBOutlet weak var cifTextField: UITextField!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var countryCheckDigitsTextField: UITextField!
    @IBOutlet weak var bankTextField: UITextField!
    @IBOutlet weak var officeTextField: UITextField!
    @IBOutlet weak var accountCheckDigitsTextField: UITextField!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.placeholder = NSLocalizedString("user_form_email_text_field_placeholder", comment: "")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension FormViewController {
    static func createFromStoryboard() -> FormViewController {
        return UIStoryboard(name: "FormViewController", bundle: .main).instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
    }
}
