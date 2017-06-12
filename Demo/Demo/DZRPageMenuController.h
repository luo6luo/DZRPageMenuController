//
//  DZRPageView.h
//  DZRPageMenu
//
//  Created by dundun on 2017/5/10.
//  Copyright © 2017年 顿顿. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DZRPageMenuDataSource <NSObject>
@required

/**将要添加到父视图中的子视图控制器*/
- (NSArray *)addChildControllersToPageMenu;

/**配置菜单栏的选项*/
- (NSDictionary *)setupPageMenuWithOptions;
    
@end

@protocol DZRPageMenuDelegate <NSObject>
@optional

/**
 * 分页菜单控制器将要把该下标的子视图控制器加载出来
 *
 * @param childController 将要加载的子视图
 * @param indexPage 子视图下标
 */
- (void)pageMenu:(UIViewController *)pageMenu willMoveTheChildController:(UIViewController *)childController atIndexPage:(NSInteger)indexPage;

/**
 * 分页菜单控制器已经把该下标的子视图控制器移出来
 *
 * @param childController 将要加载的子视图
 * @param indexPage 子视图下标
 */
- (void)pageMenu:(UIViewController *)pageMenu didMoveTheChildController:(UIViewController *)childController atIndexPage:(NSInteger)indexPage;

@end

@interface DZRPageMenuController : UIViewController

// 选项key值
extern NSString * const DZROptionItemTitleFont;

extern NSString * const DZROptionMenuHeight;         // 菜单栏高度
extern NSString * const DZROptionItemWidth;          // 菜单项宽度
extern NSString * const DZROptionIndicatorWidth;     // 指示器的宽度
extern NSString * const DZROptionIndicatorHeight;    // 指示器高度
extern NSString * const DZROptionLeftRightMargin;    // 第一个和最后一个菜单项距离父视图的留白距离
extern NSString * const DZROptionTopBottomMargin;    // 菜单项距离父视图上面和下面的距离
extern NSString * const DZROptionIndicatorTopToItem; // 指示器顶部距离对应菜单项顶部距离
extern NSString * const DZROptionItemsSpace;         // 菜单项之间的空隙

extern NSString * const DZROptionMenuColor;                  // 菜单栏的颜色
extern NSString * const DZROptionControllersScrollViewColor; // 控制器颜色
extern NSString * const DZROptionSelectorItemTitleColor;     // 选中的菜单项标题颜色
extern NSString * const DZROptionUnselectorItemTitleColor;   // 未选中菜单项标题颜色
extern NSString * const DZROptionIndicatorColor;             // 指示器的颜色

extern NSString * const DZROptionItemsCenter;                         // 菜单项是否居中显示
extern NSString * const DZROptionCanBounceHorizontal;                 // 水平滑动是否能超过父视图
extern NSString * const DZROptionIndicatorNeedToCutTheRoundedCorners; // 指示器是否切要切割圆角

@end
