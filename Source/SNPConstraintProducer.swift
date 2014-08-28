//
//  SNPConstraintProducer.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// The SNPConstraintProducer protocol provides a common interface for types
/// capable of producing constraints.
public protocol SNPConstraintProducer {
    
    /// Produces the layout constraints using the given expression.
    ///
    /// :param: relation The relation between two sides of an equation.
    /// :param: expression The expression to be used to construct a constraint.
    ///
    /// :returns: An array of installable layout constraints.
    func produceConstraints(#relation: NSLayoutRelation, expression: String) -> [SNPConstraint]
    
    // FIXME: produceConstraints(relation:expression:) - String -> Expression
    
}
