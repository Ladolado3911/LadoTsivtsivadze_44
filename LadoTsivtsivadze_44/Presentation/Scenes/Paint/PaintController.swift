//
//  PaintController.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import UIKit

class PaintController: BaseViewController {
    lazy var viewCanvas = CanvasView(frame: view.bounds)

    var btnColor: UIButton = {
       let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Set Color", for: .normal)
        b.addTarget(self, action: #selector(onPickColor), for: .touchUpInside)
        b.backgroundColor = .red
        b.contentHorizontalAlignment = .center
        return b
    }()
    
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
        view.addSubview(btnColor)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let saveButton = UIBarButtonItem(title: "Save",
                                         style: .done,
                                         target: self,
                                         action: #selector(onSave))
        
        navigationItem.rightBarButtonItem = saveButton
        viewCanvas.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            btnUndo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            btnUndo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            btnUndo.heightAnchor.constraint(equalToConstant: 45),
            btnUndo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            btnColor.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            btnColor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnColor.widthAnchor.constraint(equalToConstant: 120)
            
        ])
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        self.viewCanvas.color = color
    }
 
    @objc func onPickColor(_ sender: UIButton) {
        let colorPickerVc = UIColorPickerViewController()
        colorPickerVc.delegate = self
        present(colorPickerVc, animated: true)
    }
    
    @objc func onSave(_ sender: UIBarButtonItem) {
        //filesManager
        let image = viewCanvas.image
        
        let alertController = UIAlertController(title: "Name",
                                                message: "Enter name of pciture",
                                                preferredStyle: .alert)
        alertController.addTextField()
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .cancel) { [weak self] action in
            guard let self = self else { return }
            let name = alertController.textFields![0].text
            self.filesManager.addPicture(image: image!, nameofFile: name!)
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .destructive,
                                         handler: nil)
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @objc func onUndo() {
        viewCanvas.undo()
    }
}

extension PaintController: UIColorPickerViewControllerDelegate {
    
}
