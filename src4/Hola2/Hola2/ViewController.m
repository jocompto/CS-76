//
//  ViewController.m
//  Hola2
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Demonstrates localized strings.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, readwrite, weak) IBOutlet UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // localize greeting
    self.label.text = NSLocalizedString(@"GREETING", nil);
}

@end
