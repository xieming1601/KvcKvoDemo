//
//  ViewController.m
//  KvcKvoDemo
//
//  Created by xsm on 16/9/13.
//  Copyright © 2016年 xsm. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Author.h"
#import "Book.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize children;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //kvc的简单使用
//    [self TestPerson];
    
    //kvc键值路径使用
//    [self TestAuthor];
    
    //kvo的使用
    [self TestChildren];
}

-(void) TestPerson{
    Person* person = [[Person alloc] init];
    
    [person setValue:@"jiangwei" forKey:@"name"];
    NSDog* dog = [[NSDog alloc] init];
    [person setValue:dog forKey:@"dog"];
    [person setValue:@22 forKey:@"age"];
    
    //根据Key获取键值
    //int age = [[person valueForKey:@"age"] intValue];
    NSLog(@"%@",person);
}

-(void) TestAuthor{
    Author* author = [[Author alloc] init];
    [author setValue:@"莫言" forKeyPath:@"name"];
    
    Book *book1 = [[Book alloc] init];
    book1.name = @"红高粱";
    book1.price = 9;
    Book *book2 = [[Book alloc] init];
    book2.name = @"蛙";
    book2.price = 10;
    NSArray *array = [NSArray arrayWithObjects:book1,book2, nil];
    [author setValue:array forKeyPath:@"issueBook"];
    
    NSArray* priceArray = [author valueForKeyPath:@"issueBook.price"];
    NSLog(@"%@",priceArray);
    
    //获取数组的大小
    NSNumber *count = [author valueForKeyPath:@"issueBook.@count"];
    NSLog(@"price array count = %@",count);
    //获取书籍价格的总和
    NSNumber *sum = [author valueForKeyPath:@"issueBook.@sum.price"];
    NSLog(@"price sum = %@",sum);
    //获取书籍的平均值
    NSNumber *avg = [author valueForKeyPath:@"issueBook.@avg.price"];
    NSLog(@"price avg = %@",avg);
    //获取书籍的价格最大值和最小值
    NSNumber *max = [author valueForKeyPath:@"issueBook.@max.price"];
    NSLog(@"price max = %@",max);
    NSNumber *min = [author valueForKeyPath:@"issueBook.@min.price"];
    NSLog(@"price min = %@",min);
}

-(void) TestChildren{
//    Children* children = [[Children alloc] init];
//    Nurse* nurse = [[Nurse alloc] initWithChildren:children];
//    [nurse startWatching];
//    NSLog(@"%@",nurse);
    self.children = [[Children alloc] init];
    
    [children addObserver:self forKeyPath:@"happyValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"context"];
    
    [children addObserver:self forKeyPath:@"hungryValue" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld context:@"context"];
    
    
    
    
}

//触发方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
//    NSLog(@"%@",change);
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
    //    //移除观察者
    [children removeObserver:self forKeyPath:@"happyValue"];
    [children removeObserver:self forKeyPath:@"hungryValue"];
}

@end
