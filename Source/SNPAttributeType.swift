//
//  SNPAttributeType.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// The SNPAttributeType protocol provides a common interface for types that
/// represent a layout attribute of a view and are capable of producing
/// layout constraints.
public protocol SNPAttributeType {
    
    /// The supported type of a constant factor in the expression.
    typealias ConstantType
    
    /// A view associated with an attribute.
    var view: UIView { get }
    
    /// A foundation layout attribute. This property can be nil only when using
    /// with custom attributes, otherwise a fatal error may occur.
    var attribute: NSLayoutAttribute? { get }
    
    /// Produces the layout constraints using the given expression.
    ///
    /// :param: relation The relation between two sides of an equation.
    /// :param: expression The expression to be used to construct a constraint.
    ///
    /// :returns: An array of installable layout constraints.
    func produceConstraints(#relation: NSLayoutRelation, expression: SNPExpression<Self>) -> [SNPConstraint]
    
}
