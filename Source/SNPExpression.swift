//
//  SNPExpression.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// SNPExpression class is used to describe the right-hand side of a constraint
/// equation. It contains reference to the source attribute, constant and
/// multiplication factors and the priority.
///
/// SNPExpression is a generic class, where T is the type of the constant value
/// the expression holds.
public final class SNPExpression<T> {
    
    /// The source attribute in the expression.
    public var attribute: SNPAttributeType?
    
    /// A boolean indicating whether a constant is positive or negative. This
    /// property can be used to determine required calculations when creating
    /// custom layout attributes.
    public var constantIsPositive: Bool?
    
    /// The constant factor in the expression.
    public var constantValue: T?
    
    /// The multiplication factor in the expression.
    public var multiplier: Double = 1
    
    /// The priority of the constraint.
    public var priority: UILayoutPriority = 1000
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Creates and returns an initialized expression.
    public init() {}
    
}
