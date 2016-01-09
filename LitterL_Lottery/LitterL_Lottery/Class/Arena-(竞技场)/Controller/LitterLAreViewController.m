//竞技场控制器


#import "LitterLAreViewController.h"

@interface LitterLAreViewController ()

@end

@implementation LitterLAreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//  设置背景图片view
    [self setUpBackImage];
//  设置TitleView
    [self setUpTitleView];
}
/**
 *  设置背景图片
 */
-(void)setUpBackImage{
    //    初始化控制器  设置背景图片
    UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"NLArenaBackground"]];
    //    设置坐标
    imageview.frame = self.view.frame;
    //    添加到控制器
    [self.view addSubview:imageview];
}
/**
 *  设置TitleView
 */
-(void)setUpTitleView{
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"足球",@"篮球"]];
    //    设置默认选中
    segment.selectedSegmentIndex = 0;
    //    设置字体的颜色
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [segment setTitleTextAttributes:dict forState:UIControlStateNormal];
    //    设置背景图片
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    //    设置中间线
    segment.tintColor= [ UIColor colorWithRed:0 green:143/255.0 blue:144/255.0 alpha:1];
    self.navigationItem.titleView = segment;

}

@end
