//设置控制器

#import "LitterLSettingViewController.h"

#import "LitterLSettingGroup.h"
#import "LitterLSettingItem.h"
#import "LitterLArrowSetting.h"
#import "LitterLSwtchSetting.h"

#import "LitterLSettingClicdOneViewController.h"

#import "MBProgressHUD+XMG.h"

@interface LitterLSettingViewController ()
@end

@implementation LitterLSettingViewController

/**
 *  初始化
 *
 */
-(instancetype)init{
    self.hidesBottomBarWhenPushed = YES;
    self.navigationItem.title = @"设置";
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //       加载第一组数据
    [self setUpDate1];
    
    //       加载第二组数据
    [self setUpDate2];
    
    //       加载第三组数据
    [self setUpDate3];
}

/**
 *  加载第一组数据
 */
-(void)setUpDate1{
    //    创建一行数据
    LitterLArrowSetting *item = [LitterLArrowSetting settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    item.operationBlock = ^(NSIndexPath *indexpath){
        [MBProgressHUD showSuccess:@"您总换码以过期"];
    };
    //    创建组  用来添加行数据  以及 头标题和尾标题
    LitterLSettingGroup *grou = [[LitterLSettingGroup alloc]init];
    //    行数据赋值
    grou.items = @[item];
    //    头尾标题
    grou.headTitle=@"一定要记得使用兑换码哦";
    grou.footerTitle = @"你的兑换码已经失效了";
    //    添加总得集合中去
    [self.items addObject:grou];
}

/**
 *  加载第二组数据
 */
-(void)setUpDate2{
    //    创建一行数据
    LitterLArrowSetting *item = [LitterLArrowSetting settingItemWithImage:[UIImage imageNamed:@"MorePush"] title:@"推送提醒"];
    item.desvc = [LitterLSettingClicdOneViewController class];
    
    
    //    创建一行数据
    LitterLSettingItem *item1 = [LitterLSwtchSetting settingItemWithImage:[UIImage imageNamed:@"handShake"] title:@"使用摇一摇"];
    //    创建一行数据
    LitterLSwtchSetting *item2 = [LitterLSwtchSetting settingItemWithImage:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
         item2.open=YES;
    //    创建一行数据
    LitterLSettingItem *item3 = [LitterLSwtchSetting settingItemWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"购彩小助手"];
    
    //    创建组  用来添加行数据  以及 头标题和尾标题
    LitterLSettingGroup *grou = [[LitterLSettingGroup alloc]init];
    //    行数据赋值
    grou.items = @[item,item1,item2,item3];
    //    头尾标题
        grou.headTitle=@"不能及时收到信息  快使用推送提醒👃";
        grou.footerTitle = @"购彩不懂   快使用小猪手🐂👃";
    //    添加总得集合中去
    [self.items addObject:grou];
}

/**
 *  加载第三组数据
 */
-(void)setUpDate3{
    //    创建一行数据
    LitterLSettingItem *item = [LitterLArrowSetting settingItemWithImage:[UIImage imageNamed:@"MoreUpdate"] title:@"检查新版本"];
    item.operationBlock= ^(NSIndexPath *indexpath){
        [MBProgressHUD showSuccess:@"没有最新版本"];
    };
    //    创建一行数据
    LitterLSettingItem *item1 = [LitterLSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreShare"] title:@"分享"];
    //    创建一行数据
    LitterLSettingItem *item2 = [LitterLSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    //    创建一行数据
    LitterLSettingItem *item3 = [LitterLSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    
    //    创建组  用来添加行数据  以及 头标题和尾标题
    LitterLSettingGroup *grou = [[LitterLSettingGroup alloc]init];
    //    行数据赋值
    grou.items = @[item,item1,item2,item3];
    //    头尾标题
    //    grou.headTitle=@"一定要记得使用兑换码哦";
        grou.footerTitle = @"看一看关于  有可能对您有帮助哦";
    //    添加总得集合中去
    [self.items addObject:grou];
}


@end
