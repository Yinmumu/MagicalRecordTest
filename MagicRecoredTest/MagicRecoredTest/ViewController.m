//
//  ViewController.m
//  MagicRecoredTest
//
//  Created by BluelansMac on 16/11/25.
//  Copyright © 2016年 BluelansMac. All rights reserved.
//

#import "ViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Person+CoreDataClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)add:(id)sender {//增加9个Person
    
    NSArray *workArr = @[@"程序猿",@"学生",@"老师"];
    
    for (int i = 1 ; i < 10; i++) {
        
        Person *p = [Person MR_createEntity];
        p.name = [NSString stringWithFormat:@"小明%d",i];
        p.age = i+11;
        p.work = workArr[arc4random()%3];
    }
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
}

- (IBAction)find:(id)sender { //查询.
    
//    查询所有
    NSArray *all = [Person MR_findAll];
    NSLog(@"所有的本地的个数 %ld",all.count);
    
//    特定查询
    NSArray *iosArr = [Person MR_findByAttribute:@"work" withValue:@"程序猿"];
    NSLog(@"工作是程序员的个数 ：%ld",iosArr.count);
    
//    保存操作
    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
    
}
- (IBAction)delete:(id)sender {//删除
    
//    先查询 再删除
    //    特定查询
    NSArray *iosArr = [Person MR_findByAttribute:@"work" withValue:@"程序猿"];
    for (Person *p in iosArr) {
        
        [p MR_deleteEntity];
    }
    
    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
    
}
- (IBAction)change:(id)sender {
    //修改
//    先查询 再修改
    NSArray *iosArr = [Person MR_findByAttribute:@"work" withValue:@"程序猿"];
    for (Person *p in iosArr) {
    //把所有程序猿的年龄改为22222；
        p.age = 22222;
        
    }
    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
//    验证修改是否成功
    NSArray *all = [Person MR_findAll];
    for (Person *p in all) {
        //把所有程序猿的年龄改为22222；
        NSLog(@"%@ === %d",p.work,p.age);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
