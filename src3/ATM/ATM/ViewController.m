//
//  ViewController.m
//  ATM
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Simulates an ATM (that only accepts deposits).
//

#import "ViewController.h"

@implementation ViewController

- (IBAction)clear:(id)sender
{
    // clear input
    self.amount = 0;
    [self show];
}

- (IBAction)deposit:(id)sender
{
    // deposit amount
    self.account.balance += self.amount;
    
    // clear input
    self.amount = 0;
    [self show];
}

- (IBAction)digit:(id)sender
{
    // append digit to amount
    UIButton *b = (UIButton *)sender;
    self.amount = self.amount * 10 + b.tag;
    [self show];
}

- (void)show
{
    // show balance
    self.balanceLabel.text = [NSString stringWithFormat:@"$%llu", self.account.balance];
    
    // show input
    self.depositLabel.text = [NSString stringWithFormat:@"$%llu", self.amount];
}

- (void)viewDidLoad
{
    // create account
    self.account = [[Account alloc] init];
    [self show];
}

@end
