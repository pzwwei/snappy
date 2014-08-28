//
//  SNPAnonymousExpression.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// The SNPAnonymousExpression structure is used to describe literal values as
/// the right-hand side of a constraint equation.
///
/// :param: C The type of a constant value held by the expression.
public struct SNPAnonymousExpression <C> {
    
    /// The constant factor in the expression.
    public let constantValue: C
    
    /// The priority of the constraint.
    public var priority: UILayoutPriority = 1000
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Creates and initializes an anonymous expression.
    ///
    /// :param: The constant factor in the expression.
    init(constantValue: C) {
        self.constantValue = constantValue
    }
    
}
