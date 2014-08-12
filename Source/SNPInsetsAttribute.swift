//
//  SNPInsetsAttribute.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// This standard layout attribute can hold a numeric value (which is always
/// converted to double).
///
/// As its generic type, SNPDoubleAttribute accepts types that conform to the
/// SNPDoubleAttributeType, such as: DOuble, Float, Int and CGFloat.
public class SNPInsetsAttribute<T: SNPInsetsAttributeType>: SNPAttribute<T> {
    
    // TODO: Remove this in the next beta, when 17960407 is fixed.
    public override init(view: UIView?, attribute: NSLayoutAttribute?) {
        super.init(view: view, attribute: attribute)
    }
    
    public override func createConstraints(#relation: NSLayoutRelation, expression: SNPExpression<T>) -> [SNPConstraint] {
        let source: SNPAttribute<T> = expression.attribute ?? SNPAttribute<T>(view: self.view!.superview!, attribute: nil)
        let positive: Bool = expression.constantIsPositive ?? true
        let modifier: CGFloat = positive ? 1 : -1
        let constant: UIEdgeInsets = expression.constantValue?.snp_insetsValue ?? UIEdgeInsetsZero
        func makeConstraints(attr: NSLayoutAttribute, const: CGFloat) -> [SNPConstraint] {
            let destination = SNPEdgeAttribute<CGFloat>(view: self.view!, attribute: attr)
            let expr = SNPExpression<CGFloat>()
            expr.constantValue = const
            expr.multiplier = expression.multiplier
            expr.priority = expression.priority
            return destination.createConstraints(relation: relation, expression: expr)
        }
        var consts: [SNPConstraint] = []
        consts += makeConstraints(.Top, constant.top * modifier)
        consts += makeConstraints(.Left, constant.left * modifier)
        consts += makeConstraints(.Bottom, constant.bottom * -1 * modifier)
        consts += makeConstraints(.Right, constant.right * -1 * modifier)
        return consts
    }
    
}

// /////////////////////////////////////////////////////////////////////////////

/// SNPDoubleAttributeType denotes which types can be used as a generic type of
/// SNPDoubleAttribute instances.
public protocol SNPInsetsAttributeType {
    
    /// The double value of the receiver.
    var snp_insetsValue: UIEdgeInsets { get }
    
}

extension UIEdgeInsets: SNPInsetsAttributeType {
    public var snp_insetsValue: UIEdgeInsets { return self }
}

extension Double: SNPInsetsAttributeType {
    public var snp_insetsValue: UIEdgeInsets {
        return UIEdgeInsetsMake(CGFloat(self), CGFloat(self), CGFloat(self), CGFloat(self))
    }
}

extension Int: SNPInsetsAttributeType {
    public var snp_insetsValue: UIEdgeInsets {
        return UIEdgeInsetsMake(CGFloat(self), CGFloat(self), CGFloat(self), CGFloat(self))
    }
}

extension Float: SNPInsetsAttributeType {
    public var snp_insetsValue: UIEdgeInsets {
        return UIEdgeInsetsMake(CGFloat(self), CGFloat(self), CGFloat(self), CGFloat(self))
    }
}

extension CGFloat: SNPInsetsAttributeType {
    public var snp_insetsValue: UIEdgeInsets { return UIEdgeInsetsMake(self, self, self, self) }
}

// /////////////////////////////////////////////////////////////////////////////

public func ==(lhs: SNPAttribute<UIEdgeInsets>, rhs: SNPInsetsAttributeType) -> [SNPConstraint] {
    let expr = SNPExpression<UIEdgeInsets>()
    expr.constantValue = rhs.snp_insetsValue
    return lhs == expr
}

public func >=(lhs: SNPAttribute<UIEdgeInsets>, rhs: SNPInsetsAttributeType) -> [SNPConstraint] {
    let expr = SNPExpression<UIEdgeInsets>()
    expr.constantValue = rhs.snp_insetsValue
    return lhs >= expr
}

public func <=(lhs: SNPAttribute<UIEdgeInsets>, rhs: SNPInsetsAttributeType) -> [SNPConstraint] {
    let expr = SNPExpression<UIEdgeInsets>()
    expr.constantValue = rhs.snp_insetsValue
    return lhs <= expr
}

public func +(lhs: SNPExpression<UIEdgeInsets>, rhs: SNPInsetsAttributeType) -> SNPExpression<UIEdgeInsets> {
    lhs.constantIsPositive = true
    lhs.constantValue = rhs.snp_insetsValue
    return lhs
}

public func -(lhs: SNPExpression<UIEdgeInsets>, rhs: SNPInsetsAttributeType) -> SNPExpression<UIEdgeInsets> {
    lhs.constantIsPositive = false
    lhs.constantValue = rhs.snp_insetsValue
    return lhs
}
