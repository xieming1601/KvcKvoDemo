//
//  Book.h
//  KvcKvoDemo
//
//  Created by xsm on 16/9/13.
//  Copyright © 2016年 xsm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"

@interface Book : NSObject{
    Author* _author;
}

@property(nonatomic,strong) NSString* name;
@property(nonatomic) float price;

@end
