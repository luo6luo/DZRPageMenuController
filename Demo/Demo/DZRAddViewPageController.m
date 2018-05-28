//
//  DZRAddViewPageController.m
//  Demo
//
//  Created by dundun on 2018/5/28.
//  Copyright © 2018年 顿顿. All rights reserved.
//

#import "DZRAddViewPageController.h"
#import "DZRPageMenuController.h"
#import "DZRChildViewController.h"

@interface DZRAddViewPageController ()<DZRPageMenuDelegate, DZRPageMenuDataSource>

// addSubview 的方法一定要设置为属性，因为需要强引用一次 DZRPageMenuController，否则加载其加载完子视图后会直接dealloc
@property (nonatomic, strong) DZRPageMenuController *pageController;

@end

@implementation DZRAddViewPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"pageController";
    
   [self setupViews];
}

- (void)setupViews
{
    // 注意：使用 “addSubview” 的方法，一定要使用下列的初始化方法，否则会数据无效化。
    CGSize size = [[UIScreen mainScreen] bounds].size;
    self.pageController = [[DZRPageMenuController alloc] initWithFrame:CGRectMake(0, 100, size.width, size.height - 100) delegate:self];
    [self.view addSubview:self.pageController.view];
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
      DZROptionIndicatorTopToMenu: @(30.0),
      DZROptionItemsSpace: @(5.0),
      DZROptionMenuColor: [UIColor colorWithRed:80.0/255.0 green:143.0/255.0 blue:242.0/255.0 alpha:1.0],
      DZROptionControllersScrollViewColor: [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:244.0/255.0 alpha:1.0],
      DZROptionSelectorItemTitleColor: [UIColor colorWithRed:253.0/255.0 green:140.0/255.0 blue:37.0/255.0 alpha:1.0],
      DZROptionUnselectorItemTitleColor: [UIColor colorWithRed:254.0/255.0 green:213.0/255.0 blue:48.0/255.0 alpha:1.0],
      DZROptionIndicatorColor: [UIColor colorWithRed:253.0/255.0 green:140.0/255.0 blue:37.0/255.0 alpha:1.0],
      DZROptionItemsCenter: @(NO),
      DZROptionCanBounceHorizontal: @(NO),
      DZROptionIndicatorNeedToCutTheRoundedCorners: @(YES)
    };
    return options;
}

- (NSArray *)addChildControllersToPageMenu
{
    NSMutableArray * controllersArr = [NSMutableArray array];
    for (int i = 0; i < 7; i++) {
        DZRChildViewController * childVC = [[DZRChildViewController alloc] init];
        childVC.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0];
        childVC.text = [NSString stringWithFormat:@"item：%d",i];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%.2f",scrollView.contentOffset.y);
}

@end
