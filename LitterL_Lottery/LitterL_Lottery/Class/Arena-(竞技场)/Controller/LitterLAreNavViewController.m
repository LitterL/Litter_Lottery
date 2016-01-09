//竞技场  独有的NavViewController


#import "LitterLAreNavViewController.h"

@interface LitterLAreNavViewController ()

@end

@implementation LitterLAreNavViewController

+(void)initialize
{
    //    获取当前使用这个Navigation的UINavigationBar进行设置
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    //    设置背景图片  这里的图片有拉升
    [bar setBackgroundImage:[UIImage L_resizableImageWithCapInsets:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];

}

@end
