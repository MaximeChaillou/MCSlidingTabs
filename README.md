# MCSlidingTabs
Simple sliding tabs UI element fully customizable for iOS

##Preview
![MCSlidingTabs Top Preview](/mcslidingtabsTop.gif?raw=true "MCSlidingTabs Top Preview") ![MCSlidingTabs Bottom Preview](/mcslidingtabsBottom.gif?raw=true "MCSlidingTabs Bottom Preview")


##Documentation :

### Initialize
To initialize, it is very simple. Start by subclassing you UIViewController in UIViewController.h :
```objective-c
#import <UIKit/UIKit.h>
#import "MCSlidingTabs.h"

@interface ViewController : MCSlidingTabs

@end
```
```
```

Then, in you UIViewController.m :
```objective c
- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    [self addTab:@"Red" andImage:[UIImage imageNamed:@"iphone"] forViewController:[sb instantiateViewControllerWithIdentifier:@"red"]];
    [self addTab:@"Green" andImage:[UIImage imageNamed:@"iphone"] forViewController:[sb instantiateViewControllerWithIdentifier:@"green"]];
    [self addTab:@"Blue" andImage:[UIImage imageNamed:@"iphone"] forViewController:[sb instantiateViewControllerWithIdentifier:@"blue"]];
}
```
