//
//  Student.m
//  Students8
//
//  Robert Bowden
//  Harvard University
//  rob@cs.harvard.edu
//
//  Defines a student with init methods.
//

#import "Student.h"

@implementation Student

- (id)init
{
    self = [self initWithName:@"John" andAge:406];
    return self;
}

- (id)initWithName:(NSString *)name andAge:(int)age
{
    if (self = [super init])
    {
        self.age = age;
        self.name = name;
    }
    return self;
}

- (NSComparisonResult)compare:(Student *)otherStudent {
	return [self.name compare:otherStudent.name];
}

@end
