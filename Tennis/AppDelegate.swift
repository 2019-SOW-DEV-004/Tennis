import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController: UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame:UIScreen.main.bounds)
        let tennisViewController = TennisViewController(nibName: "TennisViewController", bundle: nil)
        navController = UINavigationController(rootViewController: tennisViewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}

