//
//  main.m
//  Students2
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Demonstrates use of a class, getters, and setters.
//

#import <Foundation/Foundation.h>
#import "Student.h"

// prototype
void greet(Student *s);

int main(int argc, const char * argv[])
{
    @autoreleasepool {

        // Alice
        Student *alice = [[Student alloc] init];
        [[alice setAge:20] setName:@"Alice"];
        greet(alice);

        // Bob
        Student *bob = [[Student alloc] init];
        [bob setAge:21];
        [bob setName:@"Bob"];
        greet(bob);
    }
    return 0;
}

// greets student (via stderr)
void greet(Student *s)
{
    NSLog(@"Hello, %@.  I see that you are %d years old.\n", [s name], [s age]);
}
