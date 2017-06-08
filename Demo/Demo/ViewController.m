//
//  ViewController.m
//  Demo
//
//  Created by dundun on 2017/6/8.
//  Copyright © 2017年 顿顿. All rights reserved.
//

#import "ViewController.h"
#import "DZRPageController.h"
#import "ChildViewController.h"

#define Screen_Width   [[UIScreen mainScreen] bounds].size.width
#define Screen_Height  [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupSubviews];
}

- (void)setupSubviews
{
    
    UIButton *navBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    navBtn.frame = CGRectMake(Screen_Width/2 - 100, Screen_Height/2 - 50, 200, 30);
    [navBtn setTitle:@"点击按钮" forState:UIControlStateNormal];
    [navBtn addTarget:self action:@selector(haveNavigationBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navBtn];
}

- (void)haveNavigationBarButtonClicked:(UIButton *)button
{
    NSMutableArray * controllersArr = [NSMutableArray array];
    for (int i = 0; i < 7; i++) {
        ChildViewController * childVC = [[ChildViewController alloc] init];
        childVC.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0];
        [controllersArr addObject:childVC];
    }
    
    NSDictionary * options = @{
      DZROptionMenuHeight: @(40.0),
      DZROptionItemWidth: @(60.0),
      DZROptionIndicatorWidth: @(35.0),
      DZROptionIndicatorHeight: @(2.0),
      DZROptionLeftRightMargin: @(15.0),
      DZROptionTopBottomMargin: @(10.0),
      DZROptionIndicatorTopToItem: @(30.0),
      DZROptionItemsSpace: @(5.0),
      DZROptionMenuColor: [UIColor colorWithRed:80.0/255.0 green:143.0/255.0 blue:242.0/255.0 alpha:1.0],
      DZROptionControllersScrollViewColor: [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:244.0/255.0 alpha:1.0],
      DZROptionSelectorItemTitleColor: [UIColor colorWithRed:253.0/255.0 green:140.0/255.0 blue:37.0/255.0 alpha:1.0],
      DZROptionUnselectorItemTitleColor: [UIColor colorWithRed:254.0/255.0 green:213.0/255.0 blue:48.0/255.0 alpha:1.0],
      DZROptionIndicatorColor: [UIColor colorWithRed:253.0/255.0 green:140.0/255.0 blue:37.0/255.0 alpha:1.0],
      DZROptionItemsCenter: @(YES),
      DZROptionCanBounceHorizontal: @(YES),
      DZROptionIndicatorNeedToCutTheRoundedCorners: @(YES)
    };
    
    
    DZRPageController *pageMenuController = [[DZRPageController alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)
                                                                         controllers:controllersArr
                                                                             options:options];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:pageMenuController];
    [nav.navigationBar setTranslucent:NO];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
