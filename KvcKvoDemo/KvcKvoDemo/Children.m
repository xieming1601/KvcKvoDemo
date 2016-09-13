//
//  Children.m
//  KvcKvoDemo
//
//  Created by xsm on 16/9/13.
//  Copyright © 2016年 xsm. All rights reserved.
//

#import "Children.h"

@implementation Children

@synthesize happyValue;
@synthesize hungryValue;


- (id) init{
    self = [super init];
    if(self != nil){
        //启动定时器
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        self.happyValue = 100;
        self.hungryValue = 100;
    }
    return self;
}

- (void) timerAction:(NSTimer *) timer{
    //使用set方法修改属性值，才能触发KVO
    int value1 = self.happyValue;
    [self setHappyValue:--value1];
    int value2 = self.hungryValue;
    [self setHungryValue:--value2];
}

@end
