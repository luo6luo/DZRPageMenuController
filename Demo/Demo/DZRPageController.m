//
//  DZRPageController.m
//  DZRPageMenu
//
//  Created by dundun on 2017/5/10.
//  Copyright © 2017年 顿顿. All rights reserved.
//

#import "DZRPageController.h"
#import "ChildViewController.h"
#import "DZRPageMenuController.h"

@interface DZRPageController ()<DZRPageMenuDelegate>

@end

@implementation DZRPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"pageController";
    
    if (self.navigationController) {
        UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(popBack:)];
        self.navigationItem.leftBarButtonItem = left;
    }
    
    self.delegate = self;
}

- (void)popBack:(UIViewController *)vc
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - DZRPageMenuDelegate

- (void)pageMenu:(UIViewController *)pageMenu willMoveTheChildController:(UIViewController *)childController atIndexPage:(NSInteger)indexPage
{
    NSLog(@"开启下标%@-------------视图%@",[NSString stringWithFormat:@"%ld",(long)indexPage],childController);
}

- (void)pageMenu:(UIViewController *)pageMenu didMoveTheChildController:(UIViewController *)childController atIndexPage:(NSInteger)indexPage
{
    NSLog(@"进入下标%@-------------视图%@",[NSString stringWithFormat:@"%ld",(long)indexPage],childController);
}

@end
