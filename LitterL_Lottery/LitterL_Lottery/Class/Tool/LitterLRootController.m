//设置控制器

#define Version @"version"
#import "LitterLRootController.h"
#import "LitterLCollectionViewController.h"
#import "LitterLTabBarController.h"

@implementation LitterLRootController

/**
 *  类方法 设置根控制器
 *
 *  @return 返回控制器
 */
+(UIViewController *)rootController{
//    获取当前版本号
    NSString *newVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
//    获取存在偏好设置中的版本号
    NSString *oldVersion = [[NSUserDefaults standardUserDefaults]objectForKey:Version];
//    定义返回的控制器
    UIViewController *root;
//    判断当前版本号和旧的版本号是否一样   一样则返回项目控制器  不一样则返回新特性控制器
    if (![newVersion isEqualToString:oldVersion]) {
//        新特性控制器
        root = [[LitterLCollectionViewController alloc]init];
//        保存当前版本号到偏好设置里面用于下一次对比
        [[NSUserDefaults standardUserDefaults]setObject:newVersion forKey:Version];
    }else{
//        项目控制器
        root = [[LitterLTabBarController alloc]init];
    }
    return root;
}

@end
