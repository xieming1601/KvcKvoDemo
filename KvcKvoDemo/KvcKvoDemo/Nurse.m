//
//  Nurse.m
//  KvcKvoDemo
//
//  Created by xsm on 16/9/13.
//  Copyright © 2016年 xsm. All rights reserved.
//

#import "Nurse.h"
#import "Children.h"

@implementation Nurse

-(id) initWithChildren:(Children *)children{
    self = [super init];
    if(self != nil){
        _children = children;
    }
    return self;
}

-(void) startWatching{
    [_children addObserver:self forKeyPath:@"happyValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"context"];
    
    [_children addObserver:self forKeyPath:@"hungryValue" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld context:@"context"];
}

//触发方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"%@",change);
    //通过打印change，我们可以看到对应的key
    //通过keyPath来判断不同属性的观察者
    if([keyPath isEqualToString:@"happyValue"]){
        //这里change中有old和new的值是因为我们在调用addObserver方法时，用到了
        //NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld；想要哪一个就用哪一个
        //[change objectForKey:@"old"]是修改前的值
        NSNumber *happyValue = [change objectForKey:@"new"];//修改之后的最新值
        int value = [happyValue intValue];
        if(value < 100){
            //do something...
            NSLog(@"observe happyValue change: %d",value);
        }
    }else if([keyPath isEqualToString:@"hungryValue"]){
        //这里change中有old和new的值是因为我们在调用addObserver方法时，用到了
        //NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld；想要哪一个就用哪一个
        //[change objectForKey:@"old"]是修改前的值
        NSNumber *hungryValue = [change objectForKey:@"new"];//修改之后的最新值
        int value = [hungryValue intValue];
        if(value < 100){
            //do something...
            NSLog(@"observe hungryValue change: %d",value);
        }
    }
//    NSLog(@"%@",context);//打印的就是addObserver方法的context参数
    //使用KVC去修改属性的值，也会触发事件
}

//- (void)dealloc{
//    NSLog(@"IN");
//    //移除观察者
//    [_children removeObserver:self forKeyPath:@"happyValue"];
//    [_children removeObserver:self forKeyPath:@"hungryValue"];
//}

@end
