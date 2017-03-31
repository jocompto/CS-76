//
//  PongView.m
//  Pong
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Demonstrates Core Graphics.
//  Inspired by iTennis by Brandon Trebitowski.
//

#import "PongView.h"

@implementation PongView

- (void)drawRect:(CGRect)rect
{
    // get context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw dashed midfield line
    CGFloat dashes[] = {1,1};
    CGContextSetLineDash(context, 0.0, dashes, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 5.0f);
    CGContextMoveToPoint(context, 240.0f, 0.0f);
    CGContextAddLineToPoint(context, 240.0f, 320.0f);
    CGContextStrokePath(context);
}

@end
