//
//  Student+StudentCompare.h
//  Students9
//
//  Robert Bowden
//  Harvard University
//  rob@cs.harvard.edu
//
//  Demonstrates sorting an array using a selector from a category
//

#import "Student.h"

@interface Student (StudentCompare)

- (NSComparisonResult)compare:(Student *)otherStudent;

@end
