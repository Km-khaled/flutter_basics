import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Load API key from Configuration.plist
    if let path = Bundle.main.path(forResource: "Configuration", ofType: "plist"),
       let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
       let apiKey = dict["GoogleMapsAPIKey"] as? String {
      GMSServices.provideAPIKey(apiKey)
    } else {
      print("Error: Couldn't find GoogleMapsAPIKey in Configuration.plist")
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
