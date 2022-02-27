//
//  UITableView+Extension.swift
//  GeneralSwift
//
//  Created by SaFaa Mohamed on 27/02/2022.
//

import UIKit
 extension UITableView {
    public func scrollToTop(animated: Bool = true) {
        if let indexPath = indexPathForRow(at: CGPoint(x: bounds.midX, y: 2)) , !isEmpty {
            scrollToRow(at: indexPath, at: .top, animated: animated)
        }
    }
    
    public var isEmpty: Bool {
        var count = 0
        for section in 0 ..< numberOfSections {
            count += numberOfRows(inSection: section)
        }
        return count == 0
    }
}
