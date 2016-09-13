//
//  ViewController.h
//  KvcKvoDemo
//
//  Created by xsm on 16/9/13.
//  Copyright © 2016年 xsm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Children.h"
#import "Nurse.h"

@interface ViewController : UIViewController

@property(nonatomic,strong) Children* children;
//@property(nonatomic,strong) Nurse* nurse;

-(void) TestPerson;
-(void) TestAuthor;
-(void) TestChildren;


@end

