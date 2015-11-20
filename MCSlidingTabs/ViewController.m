//
//  ViewController.m
//  MCSlidingTabs
//
//  Created by Maxime Chaillou on 16/11/2015.
//  Copyright © 2015 Maxime Chaillou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    [self addTab:@"Red" forViewController:[sb instantiateViewControllerWithIdentifier:@"red"]];
    [self addTab:@"Green" forViewController:[sb instantiateViewControllerWithIdentifier:@"green"]];
    [self addTab:@"Blue" forViewController:[sb instantiateViewControllerWithIdentifier:@"blue"]];
    
    self.tabBarPosition = MCSlidingTabsPositionBottom;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
