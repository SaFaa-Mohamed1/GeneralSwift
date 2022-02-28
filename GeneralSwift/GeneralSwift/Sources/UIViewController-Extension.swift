//
//  Extentions.swift
//  ValidationsSM
//
//  Created by SaFaa Mohamed on 24/02/2022.
//

 
import UIKit
 
extension UIViewController

{   /// Present viewController with completion
    public func present(_ viewControllerToPresent: UIViewController,
                        completion: @escaping (() -> ())) {
        present(viewControllerToPresent, animated: true,
                completion: completion)
    }
    /// Present viewController
    public func present(_ viewControllerToPresent: UIViewController) {
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    /// add  child ViewController
    public func addChildViewController(_ viewController: UIViewController) {
        viewController.willMove(toParent: self)
        addChild(viewController)
        viewController.view.frame = view.frame
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    /// dismiss viewController
    public func dismiss(completion: (() -> Void)? = nil) {
        presentingViewController?.dismiss(animated: true, completion: completion)
    }
    
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
                                   oTherTitle : String,
                                   cancelTitle : String,
                                   from sourceView: UIView,
                                   cancelHandler: ((UIAlertAction) -> ())? = nil,
                                   otherHandler: ((UIAlertAction) -> ())? = nil)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let oTherAction = UIAlertAction(title: oTherTitle, style: .default, handler: otherHandler)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler)
        if addCancelAction  {
            alertController.addAction(cancelAction)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }
        alertController.addAction(oTherAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
