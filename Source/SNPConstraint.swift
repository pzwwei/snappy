//
//  SNPConstraint.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

public final class SNPConstraint {
    
    /// The typealias for SNPConstraint.destination property.
    public typealias DestinationType = (view: UIView, attribute: NSLayoutAttribute)
    
    /// The typealias for SNPConstraint.source property.
    public typealias SourceType = (view: UIView?, attribute: NSLayoutAttribute)
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// The destination of a constraint (a.k.a the left-hand side).
    public let destination: DestinationType
    
    /// The source of a constraint (a.k.a. right-hand side).
    public let source: SourceType
    
    /// The relation between the sides of the constraint's equation.
    public let relation: NSLayoutRelation
    
    /// The constant factor in the constraint expression.
    public let constant: Double
    
    /// The multiplication factor in the constraint expression.
    public let multiplier: Double
    
    /// The priority of the constraint.
    public let priority: UILayoutPriority
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// The foundation NSLayoutConstraint representation of the receiver.
    public private(set) lazy var foundationConstraint: NSLayoutConstraint = {
        let constraint = NSLayoutConstraint(
            item: self.destination.view,
            attribute: self.destination.attribute,
            relatedBy: self.relation,
            toItem: self.source.view,
            attribute: self.source.attribute,
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
        if let superview = self.destination.view.snp_closestCommonSuperviewWithView(self.source.0)? {
            self.destination.view.snp_prepareForConstraintInstallation()
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
