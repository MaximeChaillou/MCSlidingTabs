# MCSlidingTabs
Simple sliding tabs UI element fully customizable for iOS

##Preview
![MCSlidingTabs Top Preview](/mcslidingtabsTop.gif?raw=true "MCSlidingTabs Top Preview") ![MCSlidingTabs Bottom Preview](/mcslidingtabsBottom.gif?raw=true "MCSlidingTabs Bottom Preview")


##Documentation :

### Initialization
To initialize, it is very simple. Start by subclassing you UIViewController in UIViewController.h :
```objective-c
#import <UIKit/UIKit.h>
#import "MCSlidingTabs.h"

@interface ViewController : MCSlidingTabs    

@end
```

Then, in your viewDidLoad in UIViewController.m :
```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    [self addTab:@"Red" andImage:[UIImage imageNamed:@"red-icon"] forViewController:[sb instantiateViewControllerWithIdentifier:@"red"]];
    [self addTab:@"Green" andImage:[UIImage imageNamed:@"green-icon"] forViewController:[sb instantiateViewControllerWithIdentifier:@"green"]];
    [self addTab:@"Blue" andImage:[UIImage imageNamed:@"blue-icon"] forViewController:[sb instantiateViewControllerWithIdentifier:@"blue"]];
}
```

That's it ! You have now your tab bar working.

If you want a tab with the title only you can use:
```objective-c
- (void)addTab:(NSString *)tabTitle forViewController: (UIViewController*)vc;
```

And if you want an image only, use this:
```objective-c
- (void)addTabImage:(UIImage *)tabImage forViewController:(UIViewController*)vc;
```

### Customization
You can modify any color of the tab bar, choose its position (bottom or top), and more. Update one of these properties before you initialize your MCSlidingTabs :
```objective-c
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
 * @brief Defines if the views are animated or not (if NO, it looks like default UITabBar). Default = YES.
 */
@property BOOL isAnimatedViews;
```

If you want to see a working application, an example is available in the project.
