#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
// this for gmaps
#import "GoogleMaps/GoogleMaps.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        // this for gmaps
        [GMSServices provideAPIKey:@"AIzaSyDIudB5Cn0DoKHZa-0JxppyqfGsEYW2KnA"];

  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
