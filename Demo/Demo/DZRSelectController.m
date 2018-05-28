//
//  DZRSelectController.m
//  Demo
//
//  Created by dundun on 2018/5/28.
//  Copyright © 2018年 顿顿. All rights reserved.
//

#import "DZRSelectController.h"
#import "DZRInheritPageController.h"
#import "DZRAddViewPageController.h"

static NSString *const kInheritTypeCell = @"inheritType";
static NSString *const kAddViewTypeCell = @"addViewType";

@interface DZRSelectController ()

@end

@implementation DZRSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择加载方式";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *inheritCell = [tableView dequeueReusableCellWithIdentifier:kInheritTypeCell];
        if (!inheritCell) {
            inheritCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kInheritTypeCell];
        }
        
        inheritCell.textLabel.text = @"选择继承的方式显示";
        return inheritCell;
    } else {
        UITableViewCell *addViewCell = [tableView dequeueReusableCellWithIdentifier:kAddViewTypeCell];
        if (!addViewCell) {
            addViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kAddViewTypeCell];
        }
        
        addViewCell.textLabel.text = @"选择加载视图的方式显示";
        return addViewCell;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        DZRInheritPageController *pageController = [[DZRInheritPageController alloc] init];
        [self.navigationController pushViewController:pageController animated:YES];
    } else {
        DZRAddViewPageController *pageController = [[DZRAddViewPageController alloc] init];
        [self.navigationController pushViewController:pageController animated:YES];
    }
}


@end
