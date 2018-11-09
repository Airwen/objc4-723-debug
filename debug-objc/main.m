//
//  main.m
//  debug-objc
//
//  Created by wang tie on 2018/10/22.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //weak test code
        Person *objc = [[Person alloc] init];
        id __weak wobjc = objc;
        id __weak wobjc1 = objc;
        id __weak wobjc2 = objc;
        
        Person *objc2 = [[Person alloc] init];
        id __weak wobjc_ = objc2;
        id __weak wobjc_1 = objc2;
        id __weak wobjc_2 = objc2;
        
        // autorelease test code
        /*
        Person  *objc = [[Person alloc] init];
        NSMutableArray *array = [NSMutableArray array];
        [Person person];
         */
        
        /*
        //test for the autorelease of subThread
        [NSThread detachNewThreadWithBlock:^{
            NSLog(@"current thread %@", [NSThread currentThread]);
            NSString *s = @"Air";
            [s stringByAppendingString:@"Loves Lala"];
            NSLog(@"current thread %@", [NSThread currentThread]);
        }];
         */
    }
    return 0;
}
