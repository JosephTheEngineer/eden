//
//  prototypeAppDelegate.m
//  prototype
//
//  Created by Ari Ronen on 10/3/10.
//  This project is licensed under the GNU General Public License v3. See https://github.com/JosephTheEngineer/Eden for more info.

//

#import "EdenAppDelegate.h"
#import "EdenViewController.h"
//#import "Flurry.h"
//#import "Appirater.h"
//#import "TestFlight.h"

@implementation EdenAppDelegate

@synthesize window;
@synthesize viewController;

/*void uncaughtExceptionHandler(NSException *exception) {
   // [FlurryAPI logError:@"Uncaught" message:@"Crash!" exception:exception];
}*/
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions { 

    // [TestFlight takeOff:@"04fc0d12-af7e-44ca-852f-bad7a896ba6c"];
    
    // Override point for customization after app launch.
    // Add your cool controller's view to the window.
   // [window addSubview:viewController.view];
    (self.window).rootViewController = viewController;
    [window makeKeyAndVisible];
    //NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
//    [Flurry startSession:@"LUWB9P4UZU1K1A4YUT9V"];
    
    
   // [Appirater rateApp];
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    [viewController stopAnimation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    [viewController startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [viewController stopAnimation];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Handle any background procedures not related to animation here.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Handle any foreground procedures not related to animation here.
}


@end
