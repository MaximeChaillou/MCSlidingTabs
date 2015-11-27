//
//  MCSlidingTabs.h
//  MCSlidingTabs
//
//  Created by Maxime Chaillou on 16/11/2015.
//  Copyright © 2015 Maxime Chaillou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    MCSlidingTabsPositionTop,
    MCSlidingTabsPositionBottom
} MCSlidingTabsPosition;

@interface MCTabObject : NSObject

@property UIViewController* viewController;
@property UIButton* button;

@end

@interface MCSlidingTabs : UIViewController

// Color Properties
@property UIColor* foregroundColorNormal;
@property UIColor* backgroundColorNormal;
@property UIColor* foregroundColorSelected;
@property UIColor* backgroundColorSelected;
@property UIColor* foregroundColorHighlighted;

// Font Properties
@property UIFont* tabFont;

// MCSlidingsTabs Properties
@property CGFloat barHeight;
@property MCSlidingTabsPosition tabBarPosition;
@property BOOL isAnimatedViews;


// Methods
- (void)addTab: (NSString*)tabTitle forViewController: (UIViewController*)vc;
- (void)addTabImage:(UIImage *)tabImage forViewController:(UIViewController*)vc;
- (void)addTab:(NSString *)tabTitle andImage:(UIImage *)tabImage forViewController:(UIViewController*)vc;

@end
