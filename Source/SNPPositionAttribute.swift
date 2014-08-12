//
//  SNPPositionAttribute.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// SNPPositionAttribute is a standard attribute which is used to describe
/// "position" layout attributes, i.e. x-center and y-center.
///
/// SNPPositionAttribute also provides a way not to explicitly specify a source
/// attribute in the expression. If it encounters an expression without a
/// source, it automatically creates one, based on the destination's superview
/// and attribute, which for x-center would be left and right for y-center.
public class SNPPositionAttribute<T: SNPDoubleAttributeType>: SNPEdgeAttribute<T> {
    
    // FIXME: Remove this in the next beta, when 17960407 is fixed.
    public override init(view: UIView?, attribute: NSLayoutAttribute?) {
        super.init(view: view, attribute: attribute)
    }
    
    public override func createConstraints(#relation: NSLayoutRelation, expression: SNPExpression<T>) -> [SNPConstraint] {
        if let attribute = self.attribute? {
            func attributeValid(attr: NSLayoutAttribute) -> Bool {
                switch attr {
                    case .CenterX, .CenterY: return true
                    default: return false
                }
            }
            func fallbackAttribute(attr: NSLayoutAttribute) -> NSLayoutAttribute {
                switch attr {
                    case .CenterX: return .Left
                    case .CenterY: return .Top
                    default: return .NotAnAttribute
                }
            }
            if attributeValid(attribute) {
                let fallback = fallbackAttribute(attribute)
                let attribute = expression.attribute ?? SNPEdgeAttribute<T>(view: self.view!.superview, attribute: fallback)
                expression.attribute = attribute
            }
        }
        return super.createConstraints(relation: relation, expression: expression)
    }
    
}

