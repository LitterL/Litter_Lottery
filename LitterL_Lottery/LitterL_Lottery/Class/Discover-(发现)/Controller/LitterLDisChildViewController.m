//发现的子视图

#import "LitterLDisChildViewController.h"
#import "LitterLDisChildTitleBtn.h"

@interface LitterLDisChildViewController ()
//用来记录视图时改变它的属性
@property(nonatomic,weak) UIButton  *btn;
@end

@implementation LitterLDisChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    设置TitleView
    [self setUpTitleView];
}
/**
 *  设置TitleView
 */
-(void)setUpTitleView{
//    因为创建出来 我想图片在右边  所以使用自定义的button
    UIButton *titlebtn = [[LitterLDisChildTitleBtn alloc]init];
    [titlebtn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [titlebtn setTitle:@"全部彩种" forState:UIControlStateNormal];
    [titlebtn sizeToFit];
    self.navigationItem.titleView = titlebtn;
    self.btn = titlebtn;
}

/**
 *  开始按下时调用
 *
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.btn setTitle:@"展示完毕" forState:UIControlStateNormal];
    [self.btn setImage:nil forState:UIControlStateNormal];
}





@end
