//
//  MainContract.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import Foundation
import UIKit

protocol MainViewContract: UIViewController {
    var presenter: MainPresenterContract? { get set
    }
}


protocol MainPresenterContract {
    var view: MainViewContract? { get set }
}
