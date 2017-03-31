//
//  ViewController.m
//  Transformations
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Demonstrates affine transformations of Rob.
//

#import "ViewController.h"


@interface ViewController () {
@private
    CGPoint _translation;
}

// private properties
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *imageView;
@property (assign, nonatomic, readwrite) float scale;

// private methods
- (void)handlePan:(UIPanGestureRecognizer *)sender;
- (void)handlePinch:(UIPinchGestureRecognizer *)sender;

@end


@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        // prepare Rob
        self.scale = 1.0;
        _translation.x = 0.0;
        _translation.y = 0.0;
    }
    return self;
}

- (void)handlePan:(UIPanGestureRecognizer *)sender
{
    // translate Rob
    CGPoint translation = [sender translationInView:self.imageView];
    CGAffineTransform scale = CGAffineTransformMakeScale(self.scale, self.scale);
    CGAffineTransform translate = CGAffineTransformMakeTranslation(_translation.x + translation.x * self.scale, _translation.y + translation.y * self.scale);
    sender.view.transform = CGAffineTransformConcat(scale, translate);
    
    // remember translation once done panning
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        _translation.x += translation.x * self.scale;
        _translation.y += translation.y * self.scale;       
    }
}

- (void)handlePinch:(UIPinchGestureRecognizer *)sender
{    
    // scale Rob
    CGFloat factor = [sender scale];
    CGAffineTransform scale = CGAffineTransformMakeScale(self.scale * factor, self.scale * factor);
    CGAffineTransform translate = CGAffineTransformMakeTranslation(_translation.x, _translation.y);
    sender.view.transform = CGAffineTransformConcat(scale, translate);
    
    // remember scale once done pinching
    if (sender.state == UIGestureRecognizerStateEnded)
        self.scale *= factor;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    // listen for pan
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.imageView addGestureRecognizer:panGesture];
    
    // listen for pinch
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [self.imageView addGestureRecognizer:pinchGesture];
}

@end
