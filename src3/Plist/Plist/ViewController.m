//
//  ViewController.m
//  Plist
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Demonstrates property lists.
//

#import "ViewController.h"


@interface ViewController ()

// private property
@property (nonatomic, readwrite, strong) NSArray *words;

@end


@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        // load words
        NSString *path = [[NSBundle mainBundle] pathForResource:@"small" ofType:@"plist"];
        NSArray *words = [[NSArray alloc] initWithContentsOfFile:path];
        self.words = words;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // allocate cell, reusing if possible
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // configure cell
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.words objectAtIndex:[indexPath row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.words count];
}

@end
