//
//  SNPExpression.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

/// The SNPExpression structure is used to describe the right-hand side of a
/// constraint equation. It contains information about the source attribute,
/// constant and multiplication factors, as well as constraint's priority.
///
/// :param: A The type of layout attribute referenced in the expression.
public struct SNPExpression <A: SNPAttributeType, C where C == A.ConstantType> {
    
    /// The source attribute referenced in the expression.
    public let attribute: A
    
    /// A boolean indicating whether a constant is positive or negative.
    public var constantPositive: Bool?

    /// The constant factor in the expression.
    public var constantValue: C?
    
    /// The multiplication factor in the expression.
    public var multiplicationValue: Double = 1
    
    /// The priority of the constraint.
    public var priority: SNPOSLayoutPriority = 1000
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Creates and returns an initialized expression.
    ///
    /// :param: attribute The source layout attribute.
    init(attribute: A) {
        self.attribute = attribute
    }
    
}

// /////////////////////////////////////////////////////////////////////////////

/// The SNPAnonymousExpression structure is used to describe literal values as
/// the right-hand side of a constraint equation.
///
/// :param: C The type of a constant value held by the expression.
public struct SNPAnonymousExpression <C> {
    
    /// The constant factor in the expression.
    public let constantValue: C
    
    /// The priority of the constraint.
    public var priority: SNPOSLayoutPriority = 1000
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Creates and returns an initialized anonymous expression.
    ///
    /// :param: The constant factor in the expression.
    init(constantValue: C) {
        self.constantValue = constantValue
    }
    
}
