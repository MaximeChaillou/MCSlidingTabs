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
    
    // Color
    self.foregroundColorNormal = [UIColor grayColor];
    self.backgroundColorNormal = [UIColor purpleColor];
    self.foregroundColorSelected = [UIColor whiteColor];
    self.backgroundColorSelected = [UIColor orangeColor];
    self.foregroundColorHighlighted = [UIColor darkGrayColor];
    
    self.tabFont = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:15];
    
    self.barHeight = 40.0f;
    self.tabBarPosition = MCSlidingTabsPositionTop;
    self.isAnimatedViews = YES;

    /* Image + Title */
    [self addTab:@"Red" andImage:[UIImage imageNamed:@"iphone"] forViewController:[sb instantiateViewControllerWithIdentifier:@"red"]];
    [self addTab:@"Green" andImage:[UIImage imageNamed:@"iphone"] forViewController:[sb instantiateViewControllerWithIdentifier:@"green"]];
    [self addTab:@"Blue" andImage:[UIImage imageNamed:@"iphone"] forViewController:[sb instantiateViewControllerWithIdentifier:@"blue"]];
    
    /* Image only */
//    [self addTabImage:[UIImage imageNamed:@"iphone"] forViewController:[sb instantiateViewControllerWithIdentifier:@"red"]];
//    [self addTabImage:[UIImage imageNamed:@"iphone"] forViewController:[sb instantiateViewControllerWithIdentifier:@"green"]];
//    [self addTabImage:[UIImage imageNamed:@"iphone"] forViewController:[sb instantiateViewControllerWithIdentifier:@"blue"]];
    
    /* Title only */
//    [self addTab:@"Red" forViewController:[sb instantiateViewControllerWithIdentifier:@"red"]];
//    [self addTab:@"Green" forViewController:[sb instantiateViewControllerWithIdentifier:@"green"]];
//    [self addTab:@"Blue" forViewController:[sb instantiateViewControllerWithIdentifier:@"blue"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
