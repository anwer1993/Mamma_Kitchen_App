
import Foundation
import UIKit

/// Protocol handle the router functionality
protocol IRouter {
    func present(screen: AppScreen, modalePresentatioinStyle: UIModalPresentationStyle, completion: (() -> Void)?)
    func push(with navigationController: UINavigationController?, screen: AppScreen, animated: Bool)
    var topVC: UIViewController? {get}
}

/// Protocol to handle the app's screens
protocol INaviagtion{}

/// the enumaration that define the different view controller in the app
enum AppScreen: INaviagtion{
    case Login
    case Verification
    case Register(source: SourceEnum? = nil)
    case SelectLocation(delegate: UpdateLocationDelegate)
    case ForgotPassword
    case Tabbar
    case AboutUs
    case ContactUs
    case AddNewFood
}

/// Class responsible for the routing functionality
struct Router: IRouter {
    
    struct Static {
        static let sharedInstance = Router()
    }
    
    static var shared = Static.sharedInstance
    
    /// Get the top view controller in the app
    var topVC: UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController  {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    
    /// Instantiate the view controller and prepare it for the navigation
    /// - Parameters:
    ///   - screen: the app screen that we will navigate to it
    ///   - modalePresentatioinStyle: the prsentation style
    /// - Returns: return the corresponding view controller for the current screen
    private func viewControllerForNavigation(screen: INaviagtion, modalePresentatioinStyle: UIModalPresentationStyle?) -> UIViewController {
        var viewController = UIViewController()
        if let screen = screen as? AppScreen {
            switch screen {
            case .Login:
                guard let vc = SignInViewController.instantiate(storyboardName: "Authentication") else {return UIViewController()}
                viewController = vc
                break
            case .Verification:
                guard let vc = VerificationViewController.instantiate(storyboardName: "Authentication") else {return UIViewController()}
                viewController = vc
                break
            case .Register(source: let source):
                guard let vc = RegisterViewController.instantiate(storyboardName: "Authentication") else {return UIViewController()}
                vc.source = source ?? .none
                viewController = vc
                break
            case .ForgotPassword:
                guard let vc = RegisterViewController.instantiate(storyboardName: "Authentication") else {return UIViewController()}
                viewController = vc
                break
            case .Tabbar:
                guard let vc = TabbarViewController.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            case .AboutUs:
                guard let vc = AboutUsViewController.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            case .ContactUs:
                guard let vc = ContactUsViewController.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            case .AddNewFood:
                guard let vc = AddNewFoodViewController.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            case .SelectLocation(delegate: let delegate):
                guard let vc = LocationViewController.instantiate(storyboardName: "Authentication") else {return UIViewController()}
                vc.delegate = delegate
                viewController = vc
                break
            }
        }
        if modalePresentatioinStyle != nil {
            viewController.modalPresentationStyle = modalePresentatioinStyle!
        }
        return viewController
    }
    
    /// present View controller
    /// - Parameters:
    ///   - screen: the corresponding screen
    ///   - modalePresentatioinStyle: the presentation style
    ///   - completion: completion handled when present the view controller
    func present(screen: AppScreen, modalePresentatioinStyle: UIModalPresentationStyle, completion: (() -> Void)?) {
        DispatchQueue.main.async {
            if let topVC = self.topVC {
                topVC.present(self.viewControllerForNavigation(screen: screen, modalePresentatioinStyle: modalePresentatioinStyle), animated: false, completion:{
                    if completion != nil {
                        completion!()
                    }
                })
            }
        }
    }
    
    /// push view controller
    /// - Parameters:
    ///   - navigationController: the navigation controller that will push the view controller
    ///   - screen: the screen we will push it
    ///   - animated: the animation value
    func push(with navigationController: UINavigationController?, screen: AppScreen, animated: Bool) {
        DispatchQueue.main.async {
            navigationController?.pushViewController(self.viewControllerForNavigation(screen: screen, modalePresentatioinStyle: nil), animated: animated)
        }
    }
    
    /// Dismiss to root view Controller
    /// - Parameter completion: Completion handled when dismiss to the root view controller
    func dismissToRootViewController(completion: @escaping () -> Void) {
        topVC?.view.window?.rootViewController?.dismiss(animated: false, completion: {
            completion()
        })
    }
    
    static func updateRootVC() {
        let status: Bool?
        var rootVC : UIViewController?
        
        if let token = AccountManager.sharedInstance.token, !token.isEmptyString {
            status = true
        }else {
            status = false
        }
        
        if(status == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabbarViewController") as? TabbarViewController
        } else{
            rootVC = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "SpalchScreen") as? SpalchScreen
        }
        
        guard let root = rootVC else {return }
        
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        let nav = UINavigationController(rootViewController: root)
        window?.rootViewController = nav
    }
}





/// Protocol use to instantiate view controller from storyboard
protocol Storyboarded {
    static func instantiate(storyboardName: String) -> Self?
}

extension Storyboarded where Self: UIViewController {
    
    /// instantiate view controller from storyboard
    /// - Parameter storyboardName: storyboard name
    /// - Returns: return the view controller instantiated
    static func instantiate(storyboardName: String) -> Self? {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        // load our storyboard
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as? Self
    }
}


protocol Navigatable {
    func backToPreviousViewController()
}


