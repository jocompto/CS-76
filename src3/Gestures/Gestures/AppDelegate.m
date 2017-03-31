//
//  AppDelegate.m
//  Gestures
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu 
//
//  Demonstrates gestures.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize viewController=_viewController;
@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
