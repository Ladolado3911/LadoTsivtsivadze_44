//
//  AppCoordinator.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import Foundation
import UIKit


final class AppCoordinator: CoordinatorProtocol {
    
    var filesManager: FilesManager
    
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
        
        self.filesManager = FilesManager()
    }
    
    func start() {
        
    }
}
