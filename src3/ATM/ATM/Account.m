//
//  Account.m
//  ATM
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Simulates an ATM (that only accepts deposits).
//

#import "Account.h"

@implementation Account

- (id)init
{
    if (self = [super init]) {
        self.balance = 0;
    }
    return self;
}

@end
