//
//  MCSlidingTabs.h
//  MCSlidingTabs
//
//  Created by Maxime Chaillou on 16/11/2015.
//  Copyright © 2015 Maxime Chaillou. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 * @typedef MCSlidingTabsPosition
 * @brief A list of tab bar position
 * @constant MCSlidingTabsPositionTop The tab bar is at the top of the screen.
 * @constant MCSlidingTabsPositionBottom The tab bar is sticked at the bottom of the screen.
 */
typedef enum {
    MCSlidingTabsPositionTop,
    MCSlidingTabsPositionBottom
} MCSlidingTabsPosition;


@interface MCSlidingTabs : UIViewController

// Color Properties
/*!
 * @brief The color of the text and the image when the tab is not selected.
 */
@property UIColor* foregroundColorNormal;
/*!
 * @brief The color of tab's background when it is not selected.
 */
@property UIColor* backgroundColorNormal;
/*!
 * @brief The color of the text and the image when the tab is selected.
 */
@property UIColor* foregroundColorSelected;
/*!
 * @brief The color of tab's background when it is selected.
 */
@property UIColor* backgroundColorSelected;
/*!
 * @brief The color of the text and the image when the tab is hightlighted (when you press the button).
 */
@property UIColor* foregroundColorHighlighted;
/*!
 * @brief The font used in the tab
 */
@property UIFont* tabFont;



// MCSlidingsTabs Properties
/*!
 * @brief The height of the tab bar. Default = 40.0f.
 */
@property CGFloat barHeight;
/*!
 * @brief The position of the tab bar. Default = MCSlidingTabsPositionBottom.
 */
@property MCSlidingTabsPosition tabBarPosition;
/*!
 * @brief Defines if the views are animated or not (if not, it looks like default UITabBar). Default = YES.
 */
@property BOOL isAnimatedViews;


// Methods
/*!
 * @discussion Add a tab with a title only.
 * @param tabTitle A NSString to be used as title of the tab.
 * @param vc The viewController linked to the tab.
 * @return void.
 */
- (void)addTab:(NSString *)tabTitle forViewController:(UIViewController *)vc;

/*!
 * @discussion Add a tab with an image only.
 * @param tabImage A UIImage to be used as icon of the tab.
 * @param vc The viewController linked to the tab.
 * @return void.
 */
- (void)addTabImage:(UIImage *)tabImage forViewController:(UIViewController *)vc;

/*!
 * @discussion A really simple way to calculate the sum of two numbers.
 * @param tabTitle A NSString to be used as title of the tab.
 * @param tabImage A UIImage to be used as icon of the tab.
 * @param vc The viewController linked to the tab.
 * @return void.
 */
- (void)addTab:(NSString *)tabTitle andImage:(UIImage *)tabImage forViewController:(UIViewController *)vc;

@end
