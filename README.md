#DZRPageMenu
--
`DZRPageMenu`是一个简单的分页菜单管理工具，可以实现类似网易头条的功能

![Pod Version](https://img.shields.io/badge/pod-v1.0.1-brightgreen.svg?style=flat) ![Pod License](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat) ![Pod Platform](https://img.shields.io/badge/platform-iOS-yellow.svg?style=flat)

##目录
* [使用条件](#使用条件)
* [描述](#描述)
* [安装](#安装)
* [使用](#使用)
* [版权](#版权)
* [个人补充](#个人补充)

###使用条件
iOS8.0及以上设备能够使用

###描述

###安装
1.使用CocoaPods安装，在`Podfile`文件中写入

    pod 'DZRPageMenu'
然后在终端输入
	
	pod install
2.如果项目没有使用CocoaPods，则可以直接将`DZRPageMenu`文件直接拖入项目，记得勾选`Copy items if needed`选项
	
###使用
1.创建一个父视图控制器，该控制器继承`DZRPageMenu`类，实现`DZRPageMenuDelegate`协议(注意:此处假设父视图控制器为`DZRSuperController`)

2.在需要创建分页控制器的位置,创建`DZRSuperController`

```
// 创建需要展示的子视图数组
NSMutableArray * childControllerArr = [NSMutableArray array];
for (int i = 0; i < 7; i++) {
    ChildViewController * childVC = [[ChildViewController alloc] init];
    [childControllerArr addObject:childVC];
}

// 创建需要的选择项, 各种选项在 DZRPageMenu.h 中有相应说明
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

/**
 * 创建分页控制器
 *
 * @param frame 控制器frame
 * @param controllers 子控制器
 * @param options 设置控制器的选项
 */
DZRSuperController *superController = [[DZRPageController alloc] initWithFrame:frame
                                                                   controllers:childControllerArr
                                                                       options:options];

// 显示superController(此处是举例)
[self presentViewController: superController animated:YES completion:nil];
```

3.具体的协议方法有2个

```
/**
 * 分页菜单控制器将要把该下标的子视图控制器加载出来
 *
 * @param childController 将要加载的子视图
 * @param indexPage 子视图下标
 */
- (void)pageMenu:(UIViewController *)pageMenu willMoveTheChildController:(UIViewController *)childController atIndexPage:(NSInteger)indexPage;
```

```
/**
 * 分页菜单控制器已经把该下标的子视图控制器加载出来
 *
 * @param childController 已经加载的子视图
 * @param indexPage 子视图下标
 */
- (void)pageMenu:(UIViewController *)pageMenu didMoveTheChildController:(UIViewController *)childController atIndexPage:(NSInteger)indexPage;
```

###版权
`DZRPageMenu`是根据`MIT license`条款和条件分发的,本文所有权属于作者。

###补充说明
`DZRPageMenu`是解读`PageMenu`源码后，作者补充改写的一个小工具，是为了个人的一个项目而设计，目前功能还很简单，待后期完善。
