//
//  AppDelegate.m
//  ShortcutKeyBook
//
//  Created by lichunwang on 16/6/18.
//  Copyright © 2016年 springcome. All rights reserved.
//

#import "AppDelegate.h"
#import "SoftwareListViewController.h"
#import "AddShortcutViewController.h"
#import "AboutMeViewController.h"
#import "UMengFeedback/UMFeedback.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [UMFeedback setAppkey:UMAppKey];
    
    [self configUI];
    
    return YES;
}

- (void)configUI
{
    // root
    SoftwareListViewController *rootViewController = [SoftwareListViewController new];
    UINavigationController *naviForRoot = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    
    // add
    AddShortcutViewController *addViewController = [AddShortcutViewController new];
    UINavigationController *naviForAdd = [[UINavigationController alloc] initWithRootViewController:addViewController];
    
    // about
    AboutMeViewController *aboutMeVewController = [AboutMeViewController new];
    UINavigationController *naviForAbout = [[UINavigationController alloc] initWithRootViewController:aboutMeVewController];
    
    UITabBarController *tabBarController = [UITabBarController new];
    [tabBarController setViewControllers:@[naviForRoot, naviForAdd, naviForAbout]];
    
    // 配置图片
    naviForRoot.tabBarItem.image = [UIImage imageNamed:@"arrow_normal"];
    naviForRoot.tabBarItem.selectedImage = [UIImage imageNamed:@"arrow_selected"];
    
    UILabel *addLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 38, 34)];
    addLabel.backgroundColor = [UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0];
    addLabel.layer.cornerRadius = 2;
    addLabel.layer.masksToBounds = YES;
    addLabel.font = [UIFont systemFontOfSize:30];
    addLabel.textColor = [UIColor whiteColor];
    addLabel.textAlignment = NSTextAlignmentCenter;
    addLabel.text = @"+";
    UIView *itemView = [naviForAdd.tabBarItem valueForKey:@"_view"];
    addLabel.center = CGPointMake(itemView.width/2.0, itemView.height/2.0);
    [itemView addSubview:addLabel];
    
    naviForAbout.tabBarItem.image = [UIImage imageNamed:@"aboutme_normal"];
    naviForAbout.tabBarItem.selectedImage = [UIImage imageNamed:@"aboutme_selected"];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarController;
    
    [self configGlobalStatusBarAppearance];
    [self configGlobalNavigationBarAppearance];
    
    [self.window makeKeyAndVisible];
}

- (void)configGlobalNavigationBarAppearance
{
    UIColor *blueColor = [UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0];
    UIColor *whiteColor = [UIColor whiteColor];
    
    // set NavigationBar背景颜色和Title颜色(方法一，只能修改单个navigationBar)
    //    [naviForRoot.navigationBar setBarTintColor:blueColor];
    //    [naviForRoot.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}]; // 这里仅仅只能修改标题的属性，返回按钮不能修改
    
    // 方法二，全局修改
    [[UINavigationBar appearance] setBarTintColor:blueColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:whiteColor, NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:18]}]; // 这里仅仅只能修改标题的属性，返回按钮不能修改
    [[UINavigationBar appearance] setTintColor:whiteColor]; // 注意：tintColor不影响标题的颜色，影响返回、左边、邮编barItem的颜色
    
    // 自定义返回按钮
    //    UIImage *backButtonImage = [[UIImage imageNamed:@"navibar_back_btn"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    //    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    // 将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
}

- (void)configGlobalStatusBarAppearance
{
    // 设置的正确方法为
//    1. 在项目的Info.plist文件里设置UIViewControllerBasedStatusBarAppearance为NO。
//    2. 使用[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];方法设置颜色。
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
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

@end