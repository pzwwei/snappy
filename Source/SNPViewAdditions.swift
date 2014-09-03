//
//  SNPViewExtensions.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

public extension SNPOSView {
    
    /// Prepares the receiver for constraint installation.
    public func snp_prepareForConstraintInstallation() {
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
    }
    
    /// Returns the closest common superview with a given view.
    ///
    /// :param: view The view with which a common superview has to be found.
    public func snp_closestCommonSuperviewWithView(view: SNPOSView?) -> SNPOSView? {
        if let view = view? {
            if self.isDescendantOfView(view) {
                return view
            } else {
                var superview: SNPOSView? = self
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
    /// :param: upToView The maximal superview from which to remove constraints.
    public func snp_removeAllConstraints(#upToView: SNPOSView) {
        var view: SNPOSView? = self.superview
        while view != nil && !view!.isDescendantOfView(upToView) {
            for constraint in view!.constraints() as [SNPOSLayoutConstraint] {
                if constraint.firstItem as? SNPOSView == self {
                    view!.removeConstraint(constraint)
                }
            }
            view = view!.superview?
        }
    }
    
    /// Removes all constraints associated with the receiver.
    public func snp_removeAllConstraints() {
        var view: SNPOSView? = self.superview?
        while view != nil {
            for constraint in view!.constraints() as [SNPOSLayoutConstraint] {
                if constraint.firstItem as? SNPOSView == self {
                    view!.removeConstraint(constraint)
                }
            }
            view = view!.superview?
        }
    }
    
}
