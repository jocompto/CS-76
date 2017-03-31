//
//  ViewController.m
//  Pong
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Demonstrates Core Graphics.
//  Inspired by iTennis by Brandon Trebitowski.
//

#import "ViewController.h"


// default velocity
static const float VELOCITY = 10.0f;


@interface ViewController () {
@private
CGPoint _velocity;
}

// private properties
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *ball;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *labelLeft;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *labelRight;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *paddleLeft;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *paddleRight;
@property (assign, nonatomic, readwrite) BOOL paused;
@property (assign, nonatomic, readwrite) NSUInteger scoreLeft;
@property (assign, nonatomic, readwrite) NSUInteger scoreRight;

@end


@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        // initialize scores
        self.scoreLeft = 0;
        self.scoreRight = 0;
        
        // initialize ball's velocity
        _velocity = CGPointMake(VELOCITY, VELOCITY);
        
        // schedule movement
        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(play) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)kickoff
{
    // pause
    self.paused = YES;

    // update scores
    self.labelLeft.text = [NSString stringWithFormat:@"%u", self.scoreLeft];
    self.labelRight.text = [NSString stringWithFormat:@"%u", self.scoreRight];
    
    // center ball
    self.ball.center = CGPointMake(240.0f, 160.0f);
        
    // align paddles
    self.paddleLeft.center = CGPointMake(25.0f, 160.0f);
    self.paddleRight.center = CGPointMake(455.0f, 160.0f);
}

- (void)play
{
    // check whether paused
    if (self.paused)
        return;
    
    // move ball
    self.ball.center = CGPointMake(self.ball.center.x + _velocity.x, self.ball.center.y + _velocity.y);
    
    // detect goals
    if (self.ball.center.x < 5) {
        self.scoreRight++;
        [self kickoff];
    }
    else if (self.view.bounds.size.width - 5 < self.ball.center.x) {
        self.scoreLeft++;
        [self kickoff];
    }
    
    // bounce off of top and bottom walls
    if (self.ball.center.y < 5 || self.view.bounds.size.height - 5 < self.ball.center.y) {
        _velocity.y = -_velocity.y;
    }
    
    // bounce off of left paddle
    if (CGRectIntersectsRect(self.ball.frame, self.paddleLeft.frame)) {
        if (self.paddleLeft.center.x < self.ball.center.x) {
            _velocity.x = -_velocity.x;
        }
    }
    
    // bounce off of right paddle
    if (CGRectIntersectsRect(self.ball.frame, self.paddleRight.frame)) {
        if (self.ball.center.x < self.paddleRight.center.x) {
            _velocity.x = -_velocity.x;
        }
    }
    
    // move opponent as ball approaches
    if (_velocity.x < 0) {
        
        // move down
        if (self.ball.center.y < self.paddleLeft.center.y) {
            self.paddleLeft.center = CGPointMake(self.paddleLeft.center.x, self.paddleLeft.center.y - 10.0f);
        }
        
        // move up
        else if (self.ball.center.y > self.paddleLeft.center.y) {
            self.paddleLeft.center = CGPointMake(self.paddleLeft.center.x, self.paddleLeft.center.y + 10.0f);
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // unpause if paused
    if (self.paused)
        self.paused = NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // follow user's finger vertically with left paddle
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:self.view];
	self.paddleRight.center = CGPointMake(self.paddleRight.center.x, location.y);
}

- (void)viewDidAppear:(BOOL)animated
{
    // play ball!
    [self kickoff];
}

@end
