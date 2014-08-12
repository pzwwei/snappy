//
//  SNPViewExtensions.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

public extension UIView {
    
    /// Prepares the receiver for constraint installation.
    public func snp_prepareForConstraintInstallation() {
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
    }
    
    /// Returns the closest common superview with a given view.
    ///
    /// :param: _view The view with which a common superview has to be found.
    public func snp_closestCommonSuperviewWithView(view: UIView?) -> UIView? {
        if let view = view? {
            if self.isDescendantOfView(view) {
                return view
            } else {
                var superview: UIView? = self
                while superview != nil {
                    if view.isDescendantOfView(superview!) {
                        return superview!
                    }
                    superview = superview!.superview
                }
                return nil
            }
        } else {
            return self.superview
        }
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Removes all constraints associated with the receiver, added up to the
    /// given view.
    ///
    /// :param: upTo The maximal superview from which to remove constraints.
    public func snp_removeAllConstraints(#upTo: UIView) {
        var view: UIView = self.superview!
        while view != nil && !view.isDescendantOfView(upTo) {
            for constraint in view.constraints() as [NSLayoutConstraint] {
                if constraint.firstItem as? UIView == self {
                    view.removeConstraint(constraint)
                }
            }
            view = view.superview!
        }
    }
    
    /// Removes all constraints associated with the receiver.
    public func snp_removeAllConstraints() {
        var view: UIView = self.superview!
        while view != nil {
            for constraint in view.constraints() as [NSLayoutConstraint] {
                if constraint.firstItem as? UIView == self {
                    view.removeConstraint(constraint)
                }
            }
            view = view.superview!
        }
    }
    
}
