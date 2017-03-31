//
//  Student.m
//  Students2
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Defines a student with getters and setters.
//

#import "Student.h"

@implementation Student

- (int)age
{
    return _age;
}

- (Student *)setAge:(int)age
{
    _age = age;
    return self;
}

- (NSString *)name
{
    return _name;
}

- (Student *)setName:(NSString *)name
{
    _name = [name copy];
    return self;
}

@end
