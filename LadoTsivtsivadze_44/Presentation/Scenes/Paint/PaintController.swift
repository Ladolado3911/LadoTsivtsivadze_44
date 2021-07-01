//
//  PaintController.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import UIKit

class PaintController: BaseViewController {
    lazy var viewCanvas = CanvasView(frame: view.bounds)
    
    var btnUndo: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Undo", for: .normal)
        b.addTarget(self, action: #selector(onUndo), for: .touchUpInside)
        b.backgroundColor = .brown
        return b
    }()
    
    override func loadView() {
        super.loadView()
        
        view = viewCanvas
        view.addSubview(btnUndo)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewCanvas.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            btnUndo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            btnUndo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            btnUndo.heightAnchor.constraint(equalToConstant: 45),
            btnUndo.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func onUndo() {
        viewCanvas.undo()
    }
}
