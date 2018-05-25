//
//  DZRPageController.m
//  DZRPageMenu
//
//  Created by dundun on 2017/5/10.
//  Copyright © 2017年 顿顿. All rights reserved.
//

#import "DZRPageController.h"
#import "ChildViewController.h"

@interface DZRPageController ()

@end

@implementation DZRPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"pageController";
}

#pragma mark - DZRPageMenuDataSource

- (NSDictionary *)setupPageMenuWithOptions
{
     NSDictionary *options = @{
       DZROptionMenuHeight: @(40.0),
       DZROptionItemWidth: @(60.0),
       DZROptionIndicatorWidth: @(35.0),
       DZROptionIndicatorHeight: @(2.0),
       DZROptionLeftRightMargin: @(15.0),
       DZROptionItemTopMargin: @(15.0),
       DZROptionItemBottomMargin: @(10.0),
       DZROptionIndicatorTopToItem: @(30.0),
       DZROptionItemsSpace: @(5.0),
       DZROptionMenuColor: [UIColor colorWithRed:80.0/255.0 green:143.0/255.0 blue:242.0/255.0 alpha:1.0],
       DZROptionControllersScrollViewColor: [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:244.0/255.0 alpha:1.0],
       DZROptionSelectorItemTitleColor: [UIColor colorWithRed:253.0/255.0 green:140.0/255.0 blue:37.0/255.0 alpha:1.0],
       DZROptionUnselectorItemTitleColor: [UIColor colorWithRed:254.0/255.0 green:213.0/255.0 blue:48.0/255.0 alpha:1.0],
       DZROptionIndicatorColor: [UIColor colorWithRed:253.0/255.0 green:140.0/255.0 blue:37.0/255.0 alpha:1.0],
       DZROptionItemsCenter: @(YES),
       DZROptionCanBounceHorizontal: @(NO),
       DZROptionIndicatorNeedToCutTheRoundedCorners: @(YES)
    };
    return options;
}

- (NSArray *)addChildControllersToPageMenu
{
    NSMutableArray * controllersArr = [NSMutableArray array];
    for (int i = 0; i < 7; i++) {
        ChildViewController * childVC = [[ChildViewController alloc] init];
        childVC.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0];
        [controllersArr addObject:childVC];
    }
    return controllersArr;
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
