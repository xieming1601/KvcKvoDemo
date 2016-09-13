//
//  Person.h
//  KvcKvoDemo
//
//  Created by xsm on 16/9/13.
//  Copyright © 2016年 xsm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDog.h"

@interface Person : NSObject{
    
@private
    NSString* _name;
    NSDog* _dog;
    NSInteger _age;
}

@end
