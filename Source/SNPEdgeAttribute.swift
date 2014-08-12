//
//  SNPEdgeAttribute.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// SNPEdgeAttribute is a standard attribute which is used to describe "edge"
/// layout attributes, such as top, left, bottom and right.
///
/// SNPEdgeAttribute also provides a way not to explicitly specify a source
/// attribute in the expression. If it encounters an expression without a
/// source, it automatically creates one, based on the destination's superview
/// and attribute.
public class SNPEdgeAttribute<T: SNPDoubleAttributeType>: SNPDoubleAttribute<T> {
    
    // FIXME: Remove this in the next beta, when 17960407 is fixed.
    public override init(view: UIView?, attribute: NSLayoutAttribute?) {
        super.init(view: view, attribute: attribute)
    }
    
    public override func createConstraints(#relation: NSLayoutRelation, expression: SNPExpression<T>) -> [SNPConstraint] {
        if let attribute = self.attribute? {
            func attributeValid(attr: NSLayoutAttribute) -> Bool {
                switch attr {
                    case .Top, .Bottom: return true
                    case .Left, .Right: return true
                    case .Leading, .Trailing: return true
                    default: return false
                }
            }
            if attributeValid(attribute) {
                let attribute = expression.attribute ?? SNPEdgeAttribute<T>(view: self.view!.superview, attribute: self.attribute)
                expression.attribute = attribute
            }
        }
        return super.createConstraints(relation: relation, expression: expression)
    }
    
}
