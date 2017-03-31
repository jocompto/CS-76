//
//  ViewController.h
//  ATM
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Simulates an ATM (that only accepts deposits).
//

#import <UIKit/UIKit.h>
#import "Account.h"

@interface ViewController : UIViewController {
}

@property (nonatomic, strong) Account *account;
@property (assign, nonatomic) unsigned long long amount;
@property (nonatomic, weak) IBOutlet UILabel *balanceLabel;
@property (nonatomic, weak) IBOutlet UILabel *depositLabel;

- (IBAction)clear:(id)sender;
- (IBAction)deposit:(id)sender;
- (IBAction)digit:(id)sender;
- (void)show;

@end
