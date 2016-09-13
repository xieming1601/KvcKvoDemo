//
//  Nurse.h
//  KvcKvoDemo
//
//  Created by xsm on 16/9/13.
//  Copyright © 2016年 xsm. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Children;

@interface Nurse : NSObject{
    Children *_children;
}

- (id) initWithChildren:(Children *)children;
- (void) startWatching;

@end
