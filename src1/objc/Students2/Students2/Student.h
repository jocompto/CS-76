//
//  Student.h
//  Students2
//
//  David J. Malan
//  Harvard University
//  malan@harvard.edu
//
//  Declares a student with getters and setters.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject {
    int _age;
    NSString *_name;
}

- (int)age;
- (Student *)setAge:(int)age;

- (NSString *)name;
- (Student *)setName:(NSString *)name;

@end
