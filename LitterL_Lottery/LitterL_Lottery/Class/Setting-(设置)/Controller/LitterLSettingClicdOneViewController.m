//推送提醒控制器

#import "LitterLSettingClicdOneViewController.h"
#import "LitterLSettingGroup.h"
#import "LitterLSettingItem.h"

@interface LitterLSettingClicdOneViewController ()

@end

@implementation LitterLSettingClicdOneViewController

/**
 *  初始化
 *
 */
-(instancetype)init{
    self.hidesBottomBarWhenPushed = YES;
    self.navigationItem.title = @"推送提醒";
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //       加载第一组数据
    [self setUpDate1];
    }

/**
 *  加载数据
 */
-(void)setUpDate1{
    //    创建一行数据
    LitterLSettingItem *item = [LitterLSettingItem settingItemWithImage:nil title:@"开奖推送"];
    //    创建一行数据
    LitterLSettingItem *item1 = [LitterLSettingItem settingItemWithImage:nil title:@"比赛直播"];
    //    创建一行数据
    LitterLSettingItem *item2 = [LitterLSettingItem settingItemWithImage:nil title:@"中奖动画"];
    //    创建一行数据
    LitterLSettingItem *item3 = [LitterLSettingItem settingItemWithImage:nil title:@"购彩大厅"];
    
    //    创建组  用来添加行数据  以及 头标题和尾标题
    LitterLSettingGroup *grou = [[LitterLSettingGroup alloc]init];
    //    行数据赋值
    grou.items = @[item,item1,item2,item3];
    
    //    添加总得集合中去
    [self.items addObject:grou];
}
@end
