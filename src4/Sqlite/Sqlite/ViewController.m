//
//  ViewController.m
//  Sqlite
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Demonstrates SQLite.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface ViewController ()

// private property
@property (nonatomic, readwrite, strong) NSMutableArray *words;

@end


@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {    
        // prepare for words
        self.words = [[NSMutableArray alloc] init];
        
        // connect to SQLite database
        sqlite3 *db;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"small" ofType:@"sqlite"];
        sqlite3_open([path UTF8String], &db);    
        
        // select all words
        NSString *sql = @"SELECT word FROM words";
        sqlite3_stmt *statement;
        sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil);
        
        // iterate over results
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *c = (char *) sqlite3_column_text(statement, 0);
            NSString *s = [[NSString alloc] initWithUTF8String:c];
            [self.words addObject:s];
        }
        
        // close database
        sqlite3_close(db);
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
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
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
