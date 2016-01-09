//创建Navigation控制器

#import "LitterLNavViewController.h"

@interface LitterLNavViewController ()<UIGestureRecognizerDelegate>

@end

@implementation LitterLNavViewController

+(void)initialize
{
//    获取当前使用这个Navigation的UINavigationBar进行设置
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
//    设置背景图片
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    //设置字体、大小、颜色
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:22];
    [bar setTitleTextAttributes:dict];
//    设置Navigation按钮颜色
    [bar setTintColor:[UIColor whiteColor]];
//    设置barbuttonitem的文字偏移向上
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    //取消系统自带的back手势
    self.interactivePopGestureRecognizer.enabled = NO;
//    添加拖动手势
    UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:ges];
    ges.delegate = self;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.childViewControllers.count !=1;
}

//handleNavigationTransition:

@end
