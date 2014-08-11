//
//  SNPConstraint.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// SNPConstraint class is used as a wrapper around a foundation constraint to
/// describe it in a friendly way. It also provides a way to manually install
/// or uninstall a constraint directly, without knowing the view it was
/// installed to.
///
/// SNPConstraint is a final class, which means you cannot subclass it.
public final class SNPConstraint {
    
    /// The typealias for SNPConstraint.destination property.
    public typealias DestinationType = (UIView, NSLayoutAttribute)
    
    /// The typealias for SNPConstraint.source property.
    public typealias SourceType = (UIView?, NSLayoutAttribute)
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// The destination of a constraint (a.k.a the left-hand side).
    public var destination: DestinationType
    
    /// The source of a constraint (a.k.a. right-hand side).
    public var source: SourceType
    
    /// The relation between the sides of the constraint's equation.
    public var relation: NSLayoutRelation
    
    /// The constant factor in the constraint expression.
    public var constant: Double
    
    /// The multiplication factor in the constraint expression.
    public var multiplier: Double

    /// The priority of the constraint.
    public var priority: UILayoutPriority

    // /////////////////////////////////////////////////////////////////////////
    
    /// The foundation NSLayoutConstraint representation of the receiver.
    public private(set) lazy var foundationConstraint: NSLayoutConstraint = {
        let constraint = NSLayoutConstraint(
            item: self.destination.0,
            attribute: self.destination.1,
            relatedBy: self.relation,
            toItem: self.source.0,
            attribute: self.source.1,
            multiplier: CGFloat(self.multiplier),
            constant: CGFloat(self.constant)
        )
        constraint.priority = self.priority
        return constraint
    }()

    /// The view that was previously used to install the constraint (if any).
    public private(set) var installationView: UIView?

    // /////////////////////////////////////////////////////////////////////////
    
    /// Creates and returns an initialized layout constraint.
    ///
    /// :param: destination The destination of a constraint.
    /// :param: source The source of a constraint.
    /// :param: relation Relation between the sides of an equation.
    /// :param: constant The constant in the constraint.
    /// :param: multiplier The multiplier in the constraint.
    /// :param: priority The priority of the constraint.
    public init(destination: DestinationType, source: SourceType, relation: NSLayoutRelation, constant: Double, multiplier: Double, priority: UILayoutPriority) {
        self.destination = destination
        self.source = source
        self.relation = relation
        self.constant = constant
        self.multiplier = multiplier
        self.priority = priority
    }

    // /////////////////////////////////////////////////////////////////////////

    /// Installs the constraint on a closest common superview between the source
    /// and the destination views.
    public func install() {
        if let superview = self.destination.0.snp_closestCommonSuperviewWithView(self.source.0)? {
            self.destination.0.snp_prepareForConstraintInstallation()
            superview.addConstraint(self.foundationConstraint)
            self.installationView = superview
        } else {
            fatalError("Cannot install a constraint between views with no common superview.")
        }
    }

    /// Removes the previously installed constraint from the installaion view.
    public func uninstall() {
        if let superview = self.installationView? {
            superview.removeConstraint(self.foundationConstraint)
        }
    }

}
