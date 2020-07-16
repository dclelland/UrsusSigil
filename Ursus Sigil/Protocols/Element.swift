//
//  Element.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public protocol Element: Decodable {
    
    var path: UIBezierPath { get }

    var attributes: ElementAttributes { get }
    
}

extension Element {
    
    func render(in context: CGContext, foregroundColor: UIColor = .black, backgroundColor: UIColor = .white) {
        context.saveGState()
        context.setStrokeColor(attributes.stroke.color(foregroundColor: foregroundColor, backgroundColor: backgroundColor).cgColor)
        context.setLineWidth(attributes.strokeWidth)
        context.setLineCap(attributes.strokeLineCap)
        context.setFillColor(attributes.fill.color(foregroundColor: foregroundColor, backgroundColor: backgroundColor).cgColor)
        context.addPath(path.cgPath)
        context.clip(using: attributes.clipRule)
        context.fillPath(using: attributes.fillRule)
        context.strokePath()
        #warning("TODO: Apply transform")
        #warning("TODO: Double check clip and fillPath calls")
        context.restoreGState()
    }
    
}
