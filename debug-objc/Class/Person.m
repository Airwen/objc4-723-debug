//
//  Person.m
//  MyLearnPractice
//
//  Created by wang tie on 2018/9/27.
//  Copyright © 2018年 wang tie. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)say {
    NSLog(@"%@ say nothing", self.name);
}

-(NSString *)jsonString {
    return [NSString stringWithFormat:@"@{\"name\":%@, \"age\":%zi}", _name, _age];
}

+ (Person *)person {
    return [[Person alloc] init];
}

// test for KVO
//- (void)willChangeValueForKey:(NSString *)key {
//    NSLog(@"%@", NSStringFromSelector(_cmd));
//    [super willChangeValueForKey:key];
//}
//
//- (void)didChangeValueForKey:(NSString *)key {
//    NSLog(@"%@", NSStringFromSelector(_cmd));
//    [super didChangeValueForKey:key];
//}

@end
