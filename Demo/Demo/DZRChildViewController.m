//
//  ChildViewController.m
//  DZRPageMenu
//
//  Created by dundun on 2017/5/11.
//  Copyright © 2017年 顿顿. All rights reserved.
//

#import "DZRChildViewController.h"

@interface DZRChildViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation DZRChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label = [UILabel new];
    self.label.frame = CGRectMake(self.view.bounds.size.width/2.0 - 50.0, 100, 100, 100);
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.label];
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.label.text = text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
