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

#import "FlipsideViewController.h"

@implementation FlipsideViewController

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
