//
//  CanvasView.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import Foundation
import UIKit

class CanvasView: UIView {

    private var points = [CGPoint]()
    
    private var lines = [[CGPoint]]()
    
    var linesMock = [
        [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 2, y: 2)], // პირველი ხაზი
        [CGPoint(x: 34, y: 34), CGPoint(x: 34, y: 2), CGPoint(x: 24, y: 24)] // მეორე ხაზი
    ]
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
//        context.move(to: .zero)
//        context.addLine(to: CGPoint(x: 100, y: 100))
        
        lines.forEach {
            
            for (index, point) in $0.enumerated() {
                if index == 0 {
                    context.move(to: point)
                } else {
                    context.addLine(to: point)
                }
            }
            
        }
        
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(2)
        context.strokePath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let point = touches.first?.location(in: self) else {return}
        
        guard var lastLine = lines.popLast() else { return }
        
        lastLine.append(point)
        
        lines.append(lastLine)
        
//        points.append(lastLine)
        
        setNeedsDisplay()
    }
    
    func undo() {
        guard !lines.isEmpty else { return }
        
        _ = lines.removeLast()
        setNeedsDisplay()
    }
    
}

