//项目启动程序

#import "AppDelegate.h"
#import "LitterLRootController.h"
#import "LitterLTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //    初始化Window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //    设置根控制器
    self.window.rootViewController = [LitterLRootController rootController];
    //    显示根控制器
    [self.window makeKeyAndVisible];
    //添加shortcutItems
    application.shortcutItems= [self setupShortcutItem];
    
    
    
    return YES;
}
/**
 *  添加shortcutItems
 *
 */
-(NSArray<UIApplicationShortcutItem *> *)setupShortcutItem{
    UIApplicationShortcutIcon *icon0 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose ];
    UIApplicationShortcutItem *item0 =[[UIApplicationShortcutItem alloc]initWithType:@"hall" localizedTitle:@"购彩大厅" localizedSubtitle:nil icon:icon0 userInfo:nil];

    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd ];
    UIApplicationShortcutItem *item1 =[[UIApplicationShortcutItem alloc]initWithType:@"are" localizedTitle:@"竞技场" localizedSubtitle:nil icon:icon1 userInfo:nil];
    
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch ];
    UIApplicationShortcutItem *item2 =[[UIApplicationShortcutItem alloc]initWithType:@"his" localizedTitle:@"开奖信息" localizedSubtitle:nil icon:icon2 userInfo:nil];
    
    
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay];
    UIApplicationShortcutItem *item3 =[[UIApplicationShortcutItem alloc]initWithType:@"mylottery" localizedTitle:@"我的彩票" localizedSubtitle:nil icon:icon3 userInfo:nil];
    
    
    NSArray<UIApplicationShortcutItem *> *itemarray =  @[item0,item1,item2,item3];
    return itemarray;
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


//点击响应

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    int i=0;
    if ([shortcutItem.type isEqualToString:@"hall"]) {
        i=0;
    }else if([shortcutItem.type isEqualToString:@"are"]) {
        i=1;
    }else if([shortcutItem.type isEqualToString:@"his"]) {
        i=3;
    }else if([shortcutItem.type isEqualToString:@"mylottery"]) {
        i=4;
    }
//    不管我点击的是谁 我都调用TabBar  只不过我传入了索引
    LitterLTabBarController *tabBar = [LitterLTabBarController TabBarSelectIndex:i];
    
//最后把控制器设置为根控制器
    self.window.rootViewController = tabBar;
    
}





@end
