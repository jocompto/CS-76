//
//  main.m
//  Students10
//
//  Robert Bowden
//  Harvard University
//  rob@cs.harvard.edu
//
//  Demonstrates sorting an array using a block
//

#import <Foundation/Foundation.h>
#import "Student.h"

// prototype
void greet(Student *s);

int main(int argc, const char * argv[])
{
    @autoreleasepool {

        // allocate array for students
        NSMutableArray *students = [[NSMutableArray alloc] init];

        // R.J.
        [students addObject:[[Student alloc] initWithName:@"R.J." andAge:20]];

        // Chris
        [students addObject:[[Student alloc] initWithName:@"Chris" andAge:20]];

        // Rob
        [students addObject:[[Student alloc] initWithName:@"Rob" andAge:20]];

        // David
        [students addObject:[[Student alloc] initWithName:@"David" andAge:21]];

        // store the block in a variable called "func". Alternatively, could
        // inline the block in the line below, similar to anonymous functions
        // in JavaScript
        NSComparisonResult (^func)(Student *, Student *) = ^NSComparisonResult(Student *a, Student *b) {
            return [a.name compare:b.name];
        };
            
        // sort the array using our block
        NSArray *sortedStudents = [students sortedArrayUsingComparator:func];

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
