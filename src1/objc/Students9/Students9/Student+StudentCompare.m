//
//  Student+StudentCompare.m
//  Students9
//
//  Robert Bowden
//  Harvard University
//  rob@cs.harvard.edu
//
//  Demonstrates sorting an array using a selector from a category
//

#import "Student+StudentCompare.h"

@implementation Student (StudentCompare)

- (NSComparisonResult)compare:(Student *)otherStudent {
	return [self.name compare:otherStudent.name];
}

@end
