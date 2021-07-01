//
//  BaseViewController.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, Storyboarded, CoordinatorDelegate {
    var coordinator: CoordinatorProtocol?
    var filesManager = FilesManager()
}
