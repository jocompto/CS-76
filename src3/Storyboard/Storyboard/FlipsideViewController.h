//
//  main.m
//  Storyboard
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Demonstrates a Utility Application using a storyboard.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
