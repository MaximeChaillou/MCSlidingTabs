//
//  MCSlidingTabs.m
//  MCSlidingTabs
//
//  Created by Maxime Chaillou on 16/11/2015.
//  Copyright © 2015 Maxime Chaillou. All rights reserved.
//

#import "MCSlidingTabs.h"

@interface MCTabObject : NSObject

@property UIViewController* viewController;
@property UIButton* button;

@end

@interface MCSlidingTabs ()

@property (strong, nonatomic) NSMutableArray* tabsArray;
@property (strong, nonatomic) UIView *tabBarView;
@property (strong, nonatomic) UIView *backgroundSelectedTabView;
@property (strong, nonatomic) MCTabObject *tabSelected;
@property (strong, nonatomic) UIView *contentView;
@property CGSize screenSize;
@property CGFloat heightStatusBar;

typedef enum {
    MCSlidingTabsDirectionLeft,
    MCSlidingTabsDirectionRight
} MCSlidingTabsDirection;

@end

@implementation MCTabObject

@end

@implementation MCSlidingTabs

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initiate Variables & default values
    self.screenSize = [[UIScreen mainScreen] bounds].size;
    self.tabsArray = [NSMutableArray new];
    
    self.foregroundColorNormal = [UIColor lightGrayColor];
    self.backgroundColorNormal = [UIColor groupTableViewBackgroundColor];
    self.foregroundColorSelected = [UIColor whiteColor];
    self.backgroundColorSelected = [UIColor colorWithRed:65/255.0 green:131/255.0 blue:215/255.0 alpha:1.0];
    self.foregroundColorHighlighted = [UIColor darkGrayColor];
    
    self.tabFont = [UIFont systemFontOfSize:17.0];
    
    self.barHeight = 40.f;
    self.tabBarPosition = MCSlidingTabsPositionBottom;
    self.isAnimatedViews = YES;
    
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
        self.heightStatusBar = 0;
    }
    else {
        self.heightStatusBar = 20;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Check if the tab count is correct (between 2 and 5)
    int tabCount = (int)[self.tabsArray count];
    NSAssert((tabCount >= 2) && (tabCount <= 5), @"You have to initialize the controller with 2 to 5 tabs");
    
    [self initViews];
    
    // Adding buttons to the tabBar
    int count = 0;
    for (MCTabObject* tab in self.tabsArray) {
        tab.button.frame = CGRectMake((self.screenSize.width / self.tabsArray.count * count), 0, self.screenSize.width / self.tabsArray.count, self.barHeight);
        [self.tabBarView addSubview:tab.button];
        count++;
    }
    
    // Activate the first tab
    [self selectTab:self.tabsArray[0] animated:NO];
}

- (void)initViews {
    if (self.tabBarPosition == MCSlidingTabsPositionTop) {
        // Create the content view
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.heightStatusBar + self.barHeight, self.view.frame.size.width, self.view.frame.size.height - self.heightStatusBar - self.barHeight)];
        // Create the tabbar view
        self.tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, self.heightStatusBar, self.screenSize.width, self.barHeight)];
        // Create the background for the selected tab
        self.backgroundSelectedTabView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screenSize.width / self.tabsArray.count, self.barHeight)];
    }
    else if (self.tabBarPosition == MCSlidingTabsPositionBottom) {
        // Create the content view
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.screenSize.height - self.barHeight)];
        // Create the tabbar view
        self.tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, self.screenSize.height - self.barHeight, self.screenSize.width, self.barHeight)];
        // Create the background for the selected tab
        self.backgroundSelectedTabView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screenSize.width / self.tabsArray.count, self.barHeight)];
    }
    
    self.tabBarView.backgroundColor = self.backgroundColorNormal;
    self.backgroundSelectedTabView.backgroundColor = self.backgroundColorSelected;
    
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.tabBarView];
    [self.tabBarView addSubview:self.backgroundSelectedTabView];
}

#pragma mark - Tab manager

// Load the VC matching with the button
- (void)tabTouched: (UIButton*) button {
    for (MCTabObject* tab in self.tabsArray) {
        // Do nothing if the tab touched is the tab selected
        if ([tab isEqual:self.tabSelected]) {
            button.tintColor = self.foregroundColorSelected;
            continue;
        }
        // The tab touched is found, let's change the view
        else if ([tab.button isEqual:button]) {
            button.tintColor = self.foregroundColorNormal;
            [self selectTab:tab animated:self.isAnimatedViews];
            break;
        }
    }
}

- (void)selectTab:(MCTabObject *)selectedTab animated:(BOOL)animated {
    
    for (MCTabObject *tab in self.tabsArray) {
        if ([tab isEqual:selectedTab]) {
            
            MCSlidingTabsDirection direction;
            
            // Positionning the view before or after the actual view
            if (animated) {
                CGRect vcFrame = tab.viewController.view.frame;
                
                if (self.tabSelected != nil && [self.tabsArray indexOfObject:selectedTab] > [self.tabsArray indexOfObject:self.tabSelected]) {
                    // RIGHT
                    direction = MCSlidingTabsDirectionRight;
                    vcFrame.origin.x = vcFrame.size.width;
                }
                else if (self.tabSelected != nil && [self.tabsArray indexOfObject:selectedTab] < [self.tabsArray indexOfObject:self.tabSelected]){
                    // LEFT
                    direction = MCSlidingTabsDirectionLeft;
                    vcFrame.origin.x = -vcFrame.size.width;
                }
                tab.viewController.view.frame = vcFrame;
            }
            
            [self addChildViewController:tab.viewController];
            [self.contentView addSubview:tab.viewController.view];
            
            [self selectMe:tab.button];
            
            self.tabSelected = tab;
            
            // Let's animate
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                // Animate the background
                CGRect frame = self.backgroundSelectedTabView.frame;
                frame.origin.x = tab.button.frame.size.width * [self.tabsArray indexOfObject:selectedTab];
                
                self.backgroundSelectedTabView.frame = frame;
                
                // Animate the content view
                if (animated) {
                    CGRect viewFrame = self.contentView.frame;
                    if (direction == MCSlidingTabsDirectionRight) {
                        viewFrame.origin.x = -viewFrame.size.width;
                    }
                    else if (direction == MCSlidingTabsDirectionLeft) {
                        viewFrame.origin.x = viewFrame.size.width;
                    }
                    self.contentView.frame = viewFrame;
                }
                
            } completion:^(BOOL finished) {
                // Remove the old viewController
                if (self.childViewControllers.count > 1) {
                    UIViewController* oldViewController = [self.childViewControllers firstObject];
                    
                    [oldViewController removeFromParentViewController];
                    [oldViewController.view removeFromSuperview];
                }
                
                // Repositionning the views
                CGRect viewFrame = self.contentView.frame;
                viewFrame.origin.x = 0;
                self.contentView.frame = viewFrame;
                viewFrame.origin.y = 0;
                tab.viewController.view.frame = viewFrame;
            }];
        }
        else {
            [self normalMe:tab.button];
        }
    }
}

#pragma mark - Tab init

// Add a new tabObject to the tabsArray.
- (void)addTab:(NSString *)tabTitle forViewController:(UIViewController*)vc {
    [self addTab:tabTitle andImage:nil forViewController:vc];
}

- (void)addTabImage:(UIImage *)tabImage forViewController:(UIViewController*)vc {
    [self addTab:nil andImage:tabImage forViewController:vc];
}

- (void)addTab:(NSString *)tabTitle andImage:(UIImage *)tabImage forViewController:(UIViewController*)vc {
    MCTabObject* tab = [MCTabObject new];
    tab.button = [self makeButton];
    if (tabTitle != nil) {
        [tab.button setTitle:tabTitle forState:UIControlStateNormal];
    }
    if (tabImage != nil) {
        UIImage *image = [tabImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [tab.button setImage:image forState:UIControlStateNormal];
    }
    if (tabImage != nil && tabTitle != nil) {
        [tab.button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 6)];
    }
    tab.viewController = vc;
    [self.tabsArray addObject:tab];
}

#pragma mark - Buttons

- (UIButton *)makeButton {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:self.foregroundColorHighlighted forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(tabTouched:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(highlightMe:) forControlEvents:UIControlEventTouchDown];
    button.titleLabel.font = self.tabFont;
    [button setAdjustsImageWhenHighlighted:NO];
    return [self normalMe:button];
}

- (UIButton *)selectMe:(UIButton *)button {
    [button setTitleColor:self.foregroundColorSelected forState:UIControlStateNormal];
    button.tintColor = self.foregroundColorSelected;
    return button;
}

- (UIButton *)normalMe:(UIButton *)button {
    [button setTitleColor:self.foregroundColorNormal forState:UIControlStateNormal];
    button.tintColor = self.foregroundColorNormal;
    return button;
}

- (void)highlightMe: (UIButton*) button {
    button.tintColor = self.foregroundColorHighlighted;
}


@end