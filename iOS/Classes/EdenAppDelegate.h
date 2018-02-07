//
//  prototypeAppDelegate.h
//  prototype
//
//  Created by Ari Ronen on 10/3/10.
//  This project is licensed under the GNU General Public License v3. See https://github.com/JosephTheEngineer/Eden for more info.

//
#ifndef Eden_Appdelegate_h
#define Eden_Appdelegate_h


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class EdenViewController;


@interface EdenAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EdenViewController *viewController;
    
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet EdenViewController *viewController;


@end

#endif
