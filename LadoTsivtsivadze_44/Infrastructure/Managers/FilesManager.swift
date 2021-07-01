//
//  FilesManager.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import Foundation
import UIKit

class FilesManager {
    
    let fileManager = FileManager.default
    
    var appUrl: URL? {
        try? fileManager.url(for: .applicationSupportDirectory,
                        in: .allDomainsMask,
                        appropriateFor: nil,
                        create: false)
    }
    
    var directories: [String] {
        guard let content = try? fileManager.contentsOfDirectory(at: appUrl!,
                                                      includingPropertiesForKeys: nil,
                                                      options: .skipsHiddenFiles) else { return [""] }
        return content.map { $0.lastPathComponent }
    }
    
    func createDirectory(name dirName: String) {
        let dirUrl = appUrl?.appendingPathComponent("\(dirName)")
        try? fileManager.createDirectory(at: dirUrl!,
                                        withIntermediateDirectories: true,
                                        attributes: nil)
        print(type(of: dirUrl))
    }
    
    func createReminderTxt(name txtName: String, dirName name: String) {
        let dirUrl = appUrl?.appendingPathComponent("\(name)")
        let txtUrl = dirUrl?.appendingPathComponent("\(txtName).txt")
        let content = txtName
        
        try? content.write(to: txtUrl!, atomically: true, encoding: .utf8)
    }
    
    func getFilesofDirectory(dirname name: String) -> [String]? {
        let dirUrl = appUrl?.appendingPathComponent("\(name)")
        guard let content = try? fileManager.contentsOfDirectory(at: dirUrl!,
                                                                 includingPropertiesForKeys: nil,
                                                                 options: .skipsHiddenFiles) else { return nil}
        return content.map { $0.lastPathComponent }
    }
    
    func getContentofFileofDirectory(dirname name: String, filename name2: String) -> String? {
        let dirUrl = appUrl?.appendingPathComponent("\(name)")
        guard let content = try? fileManager.contentsOfDirectory(at: dirUrl!,
                                                                 includingPropertiesForKeys: nil,
                                                                 options: .skipsHiddenFiles) else { return nil }
        
        let item = content.filter { $0.lastPathComponent == name2 }[0]
        let content2 = try! String(contentsOf: item, encoding: .utf8)
        return content2
    }
    
    func updateFile(using text: String, dirname name1: String, filename name2: String) {
        let dirUrl = appUrl?.appendingPathComponent("\(name1)")
        let fileUrl = dirUrl?.appendingPathComponent("\(name2)")
        
        guard let fileUrl = fileUrl else { return }
        
        try? text.write(to: fileUrl, atomically: true, encoding: .utf8)
    }
    
    func addPicture(image img1: UIImage, nameofFile name: String) {
        if let data = img1.pngData() {
            let filename = appUrl!.appendingPathComponent("\(name).png")
            try? data.write(to: filename)
        }
    }
    
    func readPictures() -> [String]? {
        return try? fileManager.contentsOfDirectory(atPath: appUrl!.absoluteString)
    }
    
    func loadImage(at name: String) -> UIImage? {
        let documentPath = appUrl!
        let imagePath = documentPath.appendingPathComponent("\(name).png")
        guard fileExists(at: imagePath.absoluteString) else {
            return nil
        }
        guard let image = UIImage(contentsOfFile: imagePath.absoluteString) else {
            return nil
        }
        return image
    }

    func fileExists(at path: String) -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }
}
