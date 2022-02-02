//
//  FormViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import UIKit

class FormViewController: UIViewController {
    
    var presenter: FormPresenterContract?
    
    //MARK: Oulets
    
    @IBOutlet weak var cifTextField: UITextField!  {
        didSet {
            cifTextField.placeholder = NSLocalizedString("user_form_CIF_text_field_placeholder", comment: "")
        }
    }
    @IBOutlet weak var companyNameTextField: UITextField! {
        didSet {
            companyNameTextField.placeholder = NSLocalizedString("user_form_company_text_field_placeholder", comment: "")
        }
    }
    @IBOutlet weak var addressTextField: UITextField! {
        didSet {
            addressTextField.placeholder = NSLocalizedString("user_form_address_text_field_placeholder", comment: "")
        }
    }
    
    @IBOutlet weak var countryCheckDigitsTextField: UITextField!   {
        didSet {
            bankTextField.placeholder = NSLocalizedString("user_form_country_check_digits_text_field_placeholder", comment: "")
        }
    }
    @IBOutlet weak var bankTextField: UITextField!  {
        didSet {
            bankTextField.placeholder = NSLocalizedString("user_form_bank_text_field_placeholder", comment: "")
        }
    }
    @IBOutlet weak var officeTextField: UITextField! {
        didSet {
            officeTextField.placeholder = NSLocalizedString("user_form_ofice_text_field_placeholder", comment: "")
        }
    }
    @IBOutlet weak var accountCheckDigitsTextField: UITextField!  {
        didSet {
            accountCheckDigitsTextField.placeholder = NSLocalizedString("user_form_account_check_digits_text_field_placeholder", comment: "")
        }
    }
    @IBOutlet weak var accountTextField: UITextField! {
        didSet {
            accountTextField.placeholder = NSLocalizedString("user_form_account_text_field_placeholder", comment: "")
        }
    }
    
    @IBOutlet weak var phoneTextField:  UITextField!  {
        didSet {
            phoneTextField.placeholder = NSLocalizedString("user_form_phone_text_field_placeholder", comment: "")
        }
    }
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.placeholder = NSLocalizedString("user_form_email_text_field_placeholder", comment: "")
        }
    }
    
    @IBOutlet weak var saveButtonOutlet: UIButton! {
        didSet {
            saveButtonOutlet.titleLabel?.text = NSLocalizedString("user_form_save_button_outlet", comment: "")
        }
    }
    @IBOutlet weak var customerFormLabel: UILabel! {
        didSet {
            customerFormLabel.text = NSLocalizedString("user_form_customer_form_label", comment: "")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressSave(_ sender: UIButton) {
        presenter?.didPressSend()
    }
}

extension FormViewController {
    static func createFromStoryboard() -> FormViewController {
        return UIStoryboard(name: "FormViewController", bundle: .main).instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
    }
}
