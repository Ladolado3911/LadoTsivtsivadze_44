//
//  CoordinatorProtocol.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var filesManager: FilesManager { get }
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
//    func proceedToProductDetails(with product: Product?)
//    func proceedToBuy(with product: Product?)
//    func showSuccessAlert()
}
