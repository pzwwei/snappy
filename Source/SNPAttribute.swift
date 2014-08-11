//
//  SNPAttribute.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// SNPAttribute class is used to describe a layout attribute along with its
/// attached view.
///
/// However, the SNPAttribute class is an abstract class and should not be
/// initialized itself, because it cannot know how to produce real layout
/// constraints. Instead, you should subclass it and explicitly override the
/// method which is responsible for layout constraints creation.
public class SNPAttribute<T> {
    
    /// A view associated with the attribute, can be nil only if the attribute
    /// is on the right-hand side of the constraint equation.
    public let view: UIView? = nil
    
    /// A foundation layout attribute, can be nil, but something must be used
    /// at the time of layout constraint creation.
    public let attribute: NSLayoutAttribute? = nil
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Creates and initializes a layout attribute.
    ///
    /// :param: view The associated view of a constraint.
    /// :param: attribute The layout attribute being described.
    public init(view: UIView?, attribute: NSLayoutAttribute?) {
        self.view = view
        self.attribute = attribute
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Produces the layout constraints using the given expression.
    ///
    /// You must override this method in your subclass. Do not call super.
    ///
    /// :param: relation The relation between two sides of an equation.
    /// :param: expression The expression to be used to construct a constraint.
    ///
    /// :returns: An array of installable layout constraints.
    public func createConstraints(#relation: NSLayoutRelation, expression: SNPExpression<T>) -> [SNPConstraint] {
        fatalError("Cannot create constraints in an attribute abstract class.")
    }
    
}
