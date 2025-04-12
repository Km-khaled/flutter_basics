import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Debug: Print the bundle path and contents
    print("Bundle path: \(Bundle.main.bundlePath)")
    if let resources = Bundle.main.urls(forResourcesWithExtension: "plist", subdirectory: nil) {
      print("Found plist files: \(resources)")
    } else {
      print("No plist files found in bundle")
    }
    
    // Load API key from Configuration.plist
    if let path = Bundle.main.path(forResource: "Configuration", ofType: "plist"),
       let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
       let apiKey = dict["GoogleMapsAPIKey"] as? String {
      print("Successfully loaded API key: \(apiKey)")
      GMSServices.provideAPIKey(apiKey)
    } else {
      print("Error: Couldn't find GoogleMapsAPIKey in Configuration.plist")
      
      // As a fallback, use the API key directly
      let apiKey = "AIzaSyAFLNT0_tr3c5c7lJjrmUpmCt93S1R2TOE"
      print("Using fallback API key: \(apiKey)")
      GMSServices.provideAPIKey(apiKey)
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
