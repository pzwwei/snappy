//
//  SNPSystemTypes.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

#if os(iOS)
    
    import UIKit
    
    public typealias SNPOSView = UIView
    
    public typealias SNPOSLayoutAttribute = NSLayoutAttribute
    public typealias SNPOSLayoutPriority = UILayoutPriority
    public typealias SNPOSLayoutRelation = NSLayoutRelation
    
    public typealias SNPOSLayoutConstraint = NSLayoutConstraint
    
#else
    
    import AppKit
    
    public typealias SNPOSView = NSView
    
    public typealias SNPOSLayoutAttribute = NSLayoutAttribute
    public typealias SNPOSLayoutPriority = NSLayoutPriority
    
    public typealias SNPOSLayoutConstraint = NSLayoutConstraint
    
#endif
