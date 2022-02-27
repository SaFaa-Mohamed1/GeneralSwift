//
//  Extentions.swift
//  ValidationsSM
//
//  Created by SaFaa Mohamed on 24/02/2022.
//

 
import UIKit
extension UIViewController
{
    /// Present alert dialog
   public func presentAlert(message: String,
                            title: String = "",
                            addCancelAction : Bool,
                            oTherTitle : String,
                            cancelTitle : String , cancelHandler: ((UIAlertAction) -> ())? = nil ,   otherHandler: ((UIAlertAction) -> ())? = nil)
   {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let oTherAction = UIAlertAction(title: oTherTitle, style: .default, handler: otherHandler)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler)
        if addCancelAction  {
            alertController.addAction(cancelAction)
        }
        alertController.addAction(oTherAction)
        self.present(alertController, animated: true, completion: nil)
    }
    ///Present ActionSheet
    public func presentActionsheet(message: String,
                                   title: String = "",
                                   addCancelAction : Bool,
                                   okTitle : String,
                                   cancelTitle : String,
                                   from sourceView: UIView)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let oKAction = UIAlertAction(title: okTitle, style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        if addCancelAction  {
            alertController.addAction(cancelAction)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }
        alertController.addAction(oKAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
}
