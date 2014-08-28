//
//  SNPAttributeType.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// The SNPAttributeType protocol provides a common interface for types that
/// represent a layout attribute of a view.
public protocol SNPAttributeType {
    
    /// A view associated with an attribute.
    var view: UIView { get }
    
    /// A foundation layout attribute. This property can be nil only when using
    /// with custom attributes, otherwise a fatal error may occur.
    var attribute: NSLayoutAttribute? { get }
    
}
