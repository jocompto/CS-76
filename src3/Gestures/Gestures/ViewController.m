//
//  ViewController.m
//  Gestures
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu 
//
//  Demonstrates gestures.
//

#import "ViewController.h"


@interface ViewController ()

// private properties
@property (assign, nonatomic, readwrite) BOOL alertInProgress;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *imageView;
@property (assign, nonatomic, readwrite) int index;
@property (nonatomic, readwrite, strong) NSArray *robs;

// private methods
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;
- (void)handleLongPress:(UILongPressGestureRecognizer *)sender;
- (void)handleSwipe:(UISwipeGestureRecognizer *)sender;

@end


@implementation ViewController

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    self.alertInProgress = NO;
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)sender
{
    if (!self.alertInProgress) {
        self.alertInProgress = YES;
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hey!" 
                                                            message:@"Stop that." 
                                                           delegate:self 
                                                  cancelButtonTitle:@"Fine" 
                                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)sender
{
    // handle swipe
    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *)sender direction];	
    switch (direction)
    {
        // ignore up, down
        case UISwipeGestureRecognizerDirectionUp:
        case UISwipeGestureRecognizerDirectionDown:
            break;
            
        // left
        case UISwipeGestureRecognizerDirectionLeft:
            self.index = (self.index + 1) % [self.robs count];
            break;
            
        // right
        case UISwipeGestureRecognizerDirectionRight:
            self.index = (self.index + [self.robs count] - 1) % [self.robs count];
            break;           
    }
    
    // update Rob
    self.imageView.image = [UIImage imageNamed:[self.robs objectAtIndex:self.index]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        // keep track of alerts
        self.alertInProgress = NO;
    
        // prepare Robs
        self.robs = [[NSArray alloc] initWithObjects:@"rob1.jpg", @"rob2.jpg", @"rob3.jpg", nil];
        self.index = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // load image
    self.imageView.image = [UIImage imageNamed:[self.robs objectAtIndex:self.index]];
    
    // listen for long press
    UILongPressGestureRecognizer *longpressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];	
    [self.imageView addGestureRecognizer:longpressGesture];
    
	// listen for right swipe
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.imageView addGestureRecognizer:swipeGesture];
    
    // listen for left swipe
    swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.imageView addGestureRecognizer:swipeGesture];
}

@end
