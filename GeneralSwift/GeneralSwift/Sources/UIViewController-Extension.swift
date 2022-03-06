//
//  Extentions.swift
//  ValidationsSM
//
//  Created by SaFaa Mohamed on 24/02/2022.
//

 
import UIKit
public protocol ViewControllerProtocol {
    func present(_ viewControllerToPresent: UIViewController,
                        completion: @escaping (() -> ()))
    func present(_ viewControllerToPresent: UIViewController)
    func dismiss(completion: (() -> Void)?)
    func presentAlert(message: String,
                             title: String ,
                             addCancelAction : Bool,
                             oTherTitle : String,
                             cancelTitle : String ,
                             cancelHandler: ((UIAlertAction) -> ())? ,
                             otherHandler: ((UIAlertAction) -> ())?)
    func presentActionsheet(message: String,
                                   title: String,
                                   addCancelAction : Bool,
                                   oTherTitle : String,
                                   cancelTitle : String,
                                   from sourceView: UIView,
                                   cancelHandler: ((UIAlertAction) -> ())?,
                                   otherHandler: ((UIAlertAction) -> ())?)
    func setuplayoutForCollectionView(direction : UICollectionView.ScrollDirection) -> UICollectionViewFlowLayout
    
}
extension UIViewController : ViewControllerProtocol

{
     
    /// Present viewController with completion
    public func present(_ viewControllerToPresent: UIViewController,
                        completion: @escaping (() -> ())) {
        present(viewControllerToPresent, animated: true,
                completion: completion)
    }
    /// Present viewController
    public func present(_ viewControllerToPresent: UIViewController) {
        present(viewControllerToPresent, animated: true, completion: nil)
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
                             cancelTitle : String,
                             cancelHandler: ((UIAlertAction) -> ())? = nil,
                             otherHandler: ((UIAlertAction) -> ())? = nil)
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
    
    public func setuplayoutForCollectionView(direction : UICollectionView.ScrollDirection) -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = direction
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        return layout
    }
}
