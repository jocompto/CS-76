//
//  AppDelegate.h
//  ATM
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Simulates an ATM (that only accepts deposits).
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UIWindow *window;

@end
