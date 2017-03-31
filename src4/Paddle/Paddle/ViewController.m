//
//  ViewController.m
//  Paddle
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Demonstrates Core Graphics with a rectangle.
//

#import "ViewController.h"
#import "PaddleView.h"


@interface ViewController ()

// private property
@property (nonatomic, retain) PaddleView *paddleView;

@end


@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        // add paddle
        self.paddleView = [[PaddleView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 10.0f, 60.0f)];
        [self.view addSubview:self.paddleView];
    }
    return self;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // follow user's finger vertically with paddle
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:self.view];
	self.paddleView.center = CGPointMake(self.paddleView.center.x, location.y);
}

@end
