# DZRPageMenuController
`DZRPageMenuController`是一个简单的分页菜单管理工具，可以实现类似网易头条的功能

![Pod Version](https://img.shields.io/badge/pod-v1.1.3-brightgreen.svg?style=flat) ![Pod License](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat) ![Pod Platform](https://img.shields.io/badge/platform-iOS-yellow.svg?style=flat)

## 目录  
* [示例](#示例)
* [使用条件](#使用条件)
* [安装](#安装)
* [使用](#使用)
* [更新日志](#更新日志)
* [版权](#版权)
* [个人补充](#个人补充)  

### 示例
![img](https://github.com/luo6luo/DZRPageMenuController/blob/master/demo.gif)

### 使用条件
iOS8.0及以上设备能够使用

### 安装
1.使用CocoaPods安装，在`Podfile`文件中写入。

    pod 'DZRPageMenuController'
然后在终端输入：
	
	pod install
2.如果项目没有使用CocoaPods，则可以直接将`DZRPageMenuController`文件直接拖入项目，记得勾选`Copy items if needed`选项。
	
### 使用
初始化方法有两种：
##### 一、继承 `DZRPageMenuController` 方式使用  
1.创建一个父视图控制器，该控制器继承`DZRPageMenuController`类（注意：此处假设父视图控制器为`DZRSuperController`）  
2.在需要创建分页控制器的位置,创建`DZRSuperController`

```objective-c
// 创建分页控制器（默认全屏）
DZRSuperController *superController = [[DZRPageController alloc] init];
// 想定制控制器的frame
// DZRSuperController *superController = [[DZRPageController alloc] initWithFrame: frame];

// 显示superController（此处是举例）
[self presentViewController: superController animated:YES completion:nil];
```
##### 二、加载 `DZRPageMenuController.view` 方式使用  
1、使用`- (instancetype)initWithFrame:(CGRect)frame`方法初始化`pageMenuController`。  
2、然后将`pageMenuController.view`加载到对应的`supview`上。  

```objective-c
// 添加 DZRPageMenuController 为属性
@property (nonatomic, strong) DZRPageMenuController *pageController;
```

```objective-c
// 创建分页控制器
self.pageMenuController = [[DZRPageController alloc] init];

// 将视图加载到想要加载的视图上
[self.view addSubview: self.pageMenuController.view];
```

**注意：** 具体的协议有2个，不管采用哪种方式都需要实现。
```objective-c
#pragma mark - DZRPageMenuDataSource（必须实现）

// 将要添加到父视图中的子视图控制器
- (NSArray *)addChildControllersToPageMenu;

// 配置菜单栏的选项
- (NSDictionary *)setupPageMenuWithOptions;
```

```objective-c
#pragma mark - DZRPageMenuDelegate（选择性实现）

/**
 * 分页菜单控制器将要把该下标的子视图控制器加载出来
 *
 * @param childController 将要加载的子视图
 * @param indexPage 子视图下标
 */
- (void)pageMenu:(UIViewController *)pageMenu willMoveTheChildController:(UIViewController *)childController atIndexPage:(NSInteger)indexPage;

/**
 * 分页菜单控制器已经把该下标的子视图控制器加载出来
 *
 * @param childController 已经加载的子视图
 * @param indexPage 子视图下标
 */
- (void)pageMenu:(UIViewController *)pageMenu didMoveTheChildController:(UIViewController *)childController atIndexPage:(NSInteger)indexPage;
```

### 更新日志

#### 1.0.1 Release(08/06/2017)
* 项目上传CocoaPods
* 第一个版本完成

#### 1.0.2 Release(08/06/2017)
* 可以直接选择性调用代理方法 

#### 1.1.0 Release(12/06/2017)
* 修改获取数据源方式，修改项目名称

#### 1.1.1 Release(12/06/2017)
* 配合CocoaPods进行更新

#### 1.1.2 Release(05/25/2018)
* 修复items不能固定的问题

#### 1.1.3 Release(05/25/2018)
* 修改添加初始化方法

### 版权
`DZRPageMenuController`是根据`MIT license`条款和条件分发的,本文所有权属于作者。

### 个人补充
* `DZRPageMenuController`是解读`PageMenu`源码后，作者补充改写的一个小工具，是为了个人的一个项目而设计，目前功能还很简单，待后期完善。
