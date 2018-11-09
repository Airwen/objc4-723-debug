//
//  Person.h
//  MyLearnPractice
//
//  Created by wang tie on 2018/9/27.
//  Copyright © 2018年 wang tie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign)NSInteger age;
- (void)say;
+ (Person *)person;
-(NSString *)jsonString;
@end
