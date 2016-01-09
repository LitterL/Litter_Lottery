//项目控制器

#import "LitterLTabBarController.h"
#import "LitterLHallTableViewController.h"
#import "LitterLAreViewController.h"
#import "LitterLDisTableViewController.h"
#import "LitterLHisTableViewController.h"
#import "LitterLMyLotteryViewController.h"
#import "LitterLtabBarButton.h"
#import "LitterLNavViewController.h"
#import "LitterLAreNavViewController.h"

@interface LitterLTabBarController ()<tabBarButtonDelegate>

//存储所有控制器tabBarItem
@property(nonatomic,strong) NSMutableArray *controllerArray;

@end

@implementation LitterLTabBarController


/**
 *  使用3D Touch时候调用
 *
 *
 */
+(instancetype)TabBarSelectIndex:(NSInteger)index{
    keyWindow.rootViewController = nil;
    LitterLTabBarController *tabBar = [[LitterLTabBarController alloc]init];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"index"] =[NSString stringWithFormat:@"%ld",index];
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"change" object:nil userInfo:dict];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
    return tabBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //    添加子控制器
    [self childControllers];
    
    //    设置TabBar
    [self tabBarButton];

}
/**
 *  懒加载
 *
 *  @return 所有控制器
 */
-(NSMutableArray *)controllerArray{
    if (!_controllerArray) {
        _controllerArray = [NSMutableArray array];
    }
    return _controllerArray;
}
#pragma mark 添加子控制器
/**
 *  添加子控制器
 */
-(void)childControllers{
    
    //    创建购票大厅控制器
    LitterLHallTableViewController *hall = [[LitterLHallTableViewController alloc]init];
    //    调用公用的方法设置Tab
    [self childControllers:hall image:[UIImage imageNamed:@"TabBar_Hall_new"] selectImage:[UIImage imageNamed:@"TabBar_Hall_selected_new"]title:@"购票大厅"];
    
    //    创建竞技场控制器
    LitterLAreViewController *are = [[LitterLAreViewController alloc]init];
    //    调用公用的方法设置Tab
    [self childControllers:are image:[UIImage imageNamed:@"TabBar_Arena_new"] selectImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]title:nil];
    
    //    利用storyboard创建发现控制器
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"LitterLDisTableViewController" bundle:nil];
    LitterLDisTableViewController *dis = [board instantiateInitialViewController];
    //    调用公用的方法设置Tab
    [self childControllers:dis image:[UIImage imageNamed:@"TabBar_Discovery_new"] selectImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"]title:@"发现"];
    
    //    创建开奖信息控制器
    LitterLHisTableViewController *his = [[LitterLHisTableViewController alloc]init];
    //    调用公用的方法设置Tab
    [self childControllers:his image:[UIImage imageNamed:@"TabBar_History_new"] selectImage:[UIImage imageNamed:@"TabBar_History_selected_new"]title:@"开奖信息"];
    
    //    创建我的彩票控制器
    LitterLMyLotteryViewController *myLottery = [[LitterLMyLotteryViewController alloc]init];
    //    调用公用的方法设置Tab
    [self childControllers:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selectImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"]title:@"我的彩票"];
}
/**
 *  封装子控件所公用的方法
 *
 *  @param vc       控制器
 *  @param image    图片
 *  @param selimage 选中图片
 */
-(void)childControllers:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selimage title:(NSString *)title{
    UINavigationController *nvc = [[LitterLNavViewController alloc]initWithRootViewController:vc];
//    判断是否为竞技场控制器  如果是就使用自己都有的控制器
    if([vc isKindOfClass:[LitterLAreViewController class]]){
        nvc = [[LitterLAreNavViewController alloc]initWithRootViewController:vc];
    }
        
    vc.title =title;
    [vc.tabBarItem setImage:image];
    [vc.tabBarItem setSelectedImage:selimage];
    [self addChildViewController:nvc];
    //    把所有控制器添加到集合里面 创建TabBar的时候使用
    [self.controllerArray addObject:vc.tabBarItem];
}

#pragma mark 设置tabBarButton
/**
 *  设置tabBarButton
 */
-(void)tabBarButton{
    LitterLtabBarButton *tabBar = [[LitterLtabBarButton alloc]init];
    tabBar.frame = self.tabBar.bounds;
    //    设置代理
    tabBar.delegate = self;
    //    用来得到tabBar的图片以及个数
    tabBar.items = self.controllerArray;
    [self.tabBar addSubview:tabBar];
}

-(void)viewDidAppear:(BOOL)animated{
    //判断tabBar  如果不是自己创建的tabBar就移除
    for (UIView *view in self.tabBar.subviews) {
        if (![view isKindOfClass:[LitterLtabBarButton class]]) {
            [view removeFromSuperview];
        }
    }
}
#pragma mark tabBarButtonDelegate
/**
 *  实现代理方法
 */
-(void)tabBarButton:(LitterLtabBarButton *)tabBar selectIndex:(NSInteger)index{
    self.selectedIndex = index;
}

@end
