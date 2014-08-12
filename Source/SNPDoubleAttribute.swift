//
//  SNPDoubleAttribute.swift
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
public class SNPDoubleAttribute<T: SNPDoubleAttributeType>: SNPAttribute<T> {
    
    // TODO: Remove this in the next beta, when 17960407 is fixed.
    public override init(view: UIView?, attribute: NSLayoutAttribute?) {
        super.init(view: view, attribute: attribute)
    }
    
    public override func createConstraints(#relation: NSLayoutRelation, expression: SNPExpression<T>) -> [SNPConstraint] {
        // TODO: NSLayoutAttribute.NotAnAttribute -> .NotAnAttribute in the next beta.
        let source: SNPAttribute<T> = expression.attribute ?? SNPAttribute<T>(view: nil, attribute: NSLayoutAttribute.NotAnAttribute)
        let positive: Bool = expression.constantIsPositive ?? true
        let modifier: Double = positive ? 1 : -1
        let constant: Double = (expression.constantValue?.snp_doubleValue ?? 0) * modifier
        return [SNPConstraint(
            destination: (self.view!, self.attribute!),
            source: (source.view, source.attribute!),
            relation: relation,
            constant: constant,
            multiplier: expression.multiplier,
            priority: expression.priority
        )]
    }
    
}

// /////////////////////////////////////////////////////////////////////////////

/// SNPDoubleAttributeType denotes which types can be used as a generic type of
/// SNPDoubleAttribute instances.
public protocol SNPDoubleAttributeType {
    
    /// The double value of the receiver.
    var snp_doubleValue: Double { get }
    
}

extension Double: SNPDoubleAttributeType {
    public var snp_doubleValue: Double { return self }
}

extension Int: SNPDoubleAttributeType {
    public var snp_doubleValue: Double { return Double(self) }
}

extension Float: SNPDoubleAttributeType {
    public var snp_doubleValue: Double { return Double(self) }
}

extension CGFloat: SNPDoubleAttributeType {
    public var snp_doubleValue: Double { return Double(self) }
}

// /////////////////////////////////////////////////////////////////////////////

public func ==(lhs: SNPAttribute<Double>, rhs: SNPDoubleAttributeType) -> [SNPConstraint] {
    let expr = SNPExpression<Double>()
    expr.constantValue = rhs.snp_doubleValue
    return lhs == expr
}

public func >=(lhs: SNPAttribute<Double>, rhs: SNPDoubleAttributeType) -> [SNPConstraint] {
    let expr = SNPExpression<Double>()
    expr.constantValue = rhs.snp_doubleValue
    return lhs >= expr
}

public func <=(lhs: SNPAttribute<Double>, rhs: SNPDoubleAttributeType) -> [SNPConstraint] {
    let expr = SNPExpression<Double>()
    expr.constantValue = rhs.snp_doubleValue
    return lhs <= expr
}

public func +(lhs: SNPExpression<Double>, rhs: SNPDoubleAttributeType) -> SNPExpression<Double> {
    lhs.constantIsPositive = true
    lhs.constantValue = rhs.snp_doubleValue
    return lhs
}

public func -(lhs: SNPExpression<Double>, rhs: SNPDoubleAttributeType) -> SNPExpression<Double> {
    lhs.constantIsPositive = false
    lhs.constantValue = rhs.snp_doubleValue
    return lhs
}
