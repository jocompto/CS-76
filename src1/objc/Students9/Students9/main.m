//
//  main.m
//  Students9
//
//  Robert Bowden
//  Harvard University
//  rob@cs.harvard.edu
//
//  Demonstrates sorting an array using a selector from a category
//

#import <Foundation/Foundation.h>
#import "Student+StudentCompare.h"

// prototype
void greet(Student *s);

int main(int argc, const char * argv[])
{
    @autoreleasepool {

        // allocate array for students
        NSMutableArray *students = [[NSMutableArray alloc] init];

        // R.J.
        [students addObject:[[Student alloc] initWithName:@"R.J." andAge:21]];
        
        // Chris
        [students addObject:[[Student alloc] initWithName:@"Chris" andAge:18]];
        
        // Rob
        [students addObject:[[Student alloc] initWithName:@"Rob" andAge:22]];
        
        // David
        [students addObject:[[Student alloc] initWithName:@"David" andAge:85]];

        // sort the array
        NSArray *sortedStudents = [students sortedArrayUsingSelector:@selector(compare:)];
        
        // greet then release each student
        for (Student *s in sortedStudents) {
            greet(s);
        }
    }
    return 0;
}

// greets student (via stderr)
void greet(Student *s)
{
    NSLog(@"Hello, %@.  I see that you are %d years old.\n", s.name, s.age);
}
