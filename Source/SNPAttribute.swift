//
//  SNPAttribute.swift
//  Snappy
//
//  Created by Adrian on 29.08.2014.
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//

import UIKit

/// The SNPAttributeType protocol provides a common interface for types that
/// represent a layout attribute of a view.
public protocol SNPAttributeType {
    
    /// The supported type of a constant factor in the expression.
    typealias ConstantValueType
    
    /// A view associated with an attribute.
    var view: UIView { get }
    
    /// A foundation layout attribute. This property can be nil only when using
    /// with custom attributes, otherwise a fatal error may occur.
    var attribute: NSLayoutAttribute { get }
    
}

/// The SNPConstraintProducing protocol provides a common interface for types
/// that are capable of producing constraints from standard expressions.
public protocol SNPConstraintProducing {
    
    /// The supported type of a constant factor in the expression.
    typealias ConstantValueType
    
    /// Produces the layout constraints using the given expression.
    ///
    /// :param: relation The relation between two sides of an equation.
    /// :param: expression The expression to be used to construct a constraint.
    ///
    /// :returns: An array of installable layout constraints.
    func produceConstraints <A where A.ConstantValueType == ConstantValueType> (#relation: NSLayoutRelation, expression: SNPExpression<A>)
    
}

/// The SNPConstraintProducing protocol provides a common interface for types
/// that are capable of producing constraints from anonymous expressions.
public protocol SNPAnonymousConstraintProducing {
    
    /// The supported type of a constant factor in the expression.
    typealias ConstantValueType
    
    /// Produces the layout constraints using the given anonymous expression.
    ///
    /// :param: relation The relation between two sides of an equation.
    /// :param: expression The expression to be used to construct a constraint.
    ///
    /// :returns: An array of installable layout constraints.
    func produceConstraints(#relation: NSLayoutRelation, expression: SNPAnonymousExpression<ConstantValueType>)
    
}
