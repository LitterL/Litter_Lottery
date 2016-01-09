//我的彩票控制器


#import "LitterLMyLotteryViewController.h"
#import "LitterLSettingViewController.h"



@interface LitterLMyLotteryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LitterLMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//设置子控件
    [self ChildView];
}

-(void)ChildView{
//    设置登录图片的  
    UIImage *image = self.loginBtn.currentBackgroundImage;
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.5, image.size.height * 0.5, image.size.width * 0.5)];
    [self.loginBtn setBackgroundImage:image forState:UIControlStateNormal];
//    设置左上角的button
    UIButton *leftbutton = [[UIButton alloc]init];
    [leftbutton setImage:[UIImage imageNamed:@"FBMM_Barbutton" ] forState:UIControlStateNormal];
    [leftbutton setTitle:@"客服" forState:UIControlStateNormal];
    [leftbutton sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
//    设置右上角的button
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Mylottery_config"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBth)];
}
/**
 *  我的设置
 */
-(void)rightBth{
    LitterLSettingViewController *setting = [[LitterLSettingViewController alloc]init];
    [self.navigationController pushViewController:setting animated:YES];
}


@end
