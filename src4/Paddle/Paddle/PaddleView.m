//
//  PaddleView.m
//  Paddle
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Demonstrates Core Graphics with a rectangle.
//

#import "PaddleView.h"

@implementation PaddleView

- (void)drawRect:(CGRect)rect
{
    CGRect square = CGRectMake(0.0f, 0.0f, 10.0f, 60.0f);
    [[UIColor whiteColor] set];
    UIRectFill(square);
}

@end
