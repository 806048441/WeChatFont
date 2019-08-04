//
//  AppDelegate.m
//  WeChatFontSize
//
//  Created by 神州第一坑 on 2019/8/2.
//  Copyright © 2019 FirstKeng. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSArray <NSString*>*controllers =@[@"MessageViewController",@"AddressBookViewController",@"DetectionViewController",@"MineViewController"];
    NSArray <NSString*>*titleArr=@[@"微信",@"通讯录",@"发现",@"我"];
    NSArray <NSString*>*navImgArr=@[@"",@"",@"",@""];
    NSArray <NSString*>*navSelectedImgArr=@[@"",@"",@"",@""];

    
    BaseTabBarController * tabBar = [[BaseTabBarController alloc]init];
    NSMutableArray *ncArray = [NSMutableArray array];
    
    [controllers enumerateObjectsUsingBlock:^(id  _Nonnull class, NSUInteger idx, BOOL * _Nonnull stop) {
        
        BaseNavigationController *nc = [[BaseNavigationController alloc] initWithRootViewController:[[NSClassFromString(class) alloc] init]];
        
        [ncArray addObject:nc];
        nc.tabBarItem.tag = idx;
        nc.tabBarItem.image = [[UIImage imageNamed:navImgArr [idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        nc.tabBarItem.selectedImage = [[UIImage imageNamed:navSelectedImgArr[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nc.tabBarItem.title = titleArr[idx];
        
        [nc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:font_set(11)} forState:UIControlStateNormal];
        [nc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:font_set(11)} forState:UIControlStateSelected];
    }];
    
    tabBar.viewControllers = ncArray;
    [tabBar.tabBar setShadowImage:[UIImage new]];
    [tabBar.tabBar setBackgroundImage:[UIImage new]];
    [tabBar.tabBar setBackgroundColor:[UIColor whiteColor]];
    
    
    self.window.rootViewController = tabBar;
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
