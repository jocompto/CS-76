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

#import "MainViewController.h"

@implementation MainViewController

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
