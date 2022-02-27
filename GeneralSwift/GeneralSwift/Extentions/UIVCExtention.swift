//
//  Extentions.swift
//  ValidationsSM
//
//  Created by SaFaa Mohamed on 24/02/2022.
//

 
import UIKit
extension UIViewController
{
    
    func showAlert(message: String, title: String = "" , addCancelAction : Bool ,okTitle : String , cancelTitle : String ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let oKAction = UIAlertAction(title: okTitle, style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        if addCancelAction  {
            alertController.addAction(cancelAction)
        }
        alertController.addAction(oKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func showActionsheet(message: String, title: String = "" , addCancelAction : Bool ,okTitle : String , cancelTitle : String  , from sourceView: UIView) {
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
