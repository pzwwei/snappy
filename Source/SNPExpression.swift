//
//  SNPExpression.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// The SNPExpression structure is used to describe the right-hand side of a
/// constraint equation. It contains information about the source attribute,
/// constant and multiplication factors, as well as constraint's priority.
///
/// :param: A The type of layout attribute referenced in the expression.
public struct SNPExpression <A: SNPAttributeType> {
    
    /// The source attribute referenced in the expression.
    public let attribute: A
    
    /// A boolean indicating whether a constant is positive or negative.
    public var constantPositive: Bool?

    /// The constant factor in the expression.
    public var constantValue: A.ConstantType?
    
    /// The multiplication factor in the expression.
    public var multiplicationValue: Double = 1
    
    /// The priority of the constraint.
    public var priority: UILayoutPriority = 1000
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Creates and initializes an expression.
    ///
    /// :param: attribute The source layout attribute.
    init(attribute: A) {
        self.attribute = attribute
    }
    
}
