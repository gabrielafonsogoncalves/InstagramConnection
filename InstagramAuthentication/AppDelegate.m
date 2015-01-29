//
//  AppDelegate.m
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "AppDelegate.h"
#import "GAMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    GAMainViewController *firstViewController = [[GAMainViewController alloc] initWithNibName:@"GAMainViewController" bundle:nil];
    [self.window setRootViewController:firstViewController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Handling incoming URL

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSArray *components = [url.absoluteString componentsSeparatedByString:@"="];
    [AppDelegate saveUserToken:components.lastObject];
    
    GAMainViewController *firstViewController = [[GAMainViewController alloc] initWithNibName:@"GAMainViewController" bundle:nil];
    [self.window.rootViewController presentViewController:firstViewController animated:NO completion:nil];

    return YES;
}

+ (NSString *)token {
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"GA_token"];
}

+ (void)saveUserToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"GA_token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)userId {
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"GA_userID"];
}

+ (void)saveUserId:(NSString *)userId {
    [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"GA_userID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
