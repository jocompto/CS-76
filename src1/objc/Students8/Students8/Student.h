//
//  Student.h
//  Students8
//
//  Robert Bowden
//  Harvard University
//  rob@cs.harvard.edu
//
//  Declares a student with init methods.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject {
}

@property (assign, nonatomic, readwrite) int age;
@property (copy, nonatomic, readwrite) NSString *name;

- (id)initWithName:(NSString *)name andAge:(int)age;
- (NSComparisonResult)compare:(Student *)otherStudent;


@end
