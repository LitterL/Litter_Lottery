//购票大厅控制器

#import "LitterLHallTableViewController.h"
#import "LitterLMasking.h"
#import "LitterLMaskChild.h"

@interface LitterLHallTableViewController ()<MaskChildDelegate>

@end

@implementation LitterLHallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    得到不渲染的图片
    UIImage *leftBtnImage = [UIImage L_imageWithRenderingName:@"CS50_activity_image"];
//    把不渲染的图片添加到左边按钮上   并且添加事件
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:leftBtnImage style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnClick)];
    
    
    
}
/**
 *  左边按钮事件
 */
-(void)leftBtnClick{
//    弹出蒙版
    [LitterLMasking show];
    
    LitterLMaskChild *maskchild = [LitterLMaskChild showWithCenter:self.view.center];
    maskchild.delegate = self;
}

#pragma mark MaskChildDelegate
-(void)MaskChild:(LitterLMaskChild *)child{
    
    [child hideWithPoint:CGPointMake(44,44) completaion:^{
//        隐藏蒙版
        [LitterLMasking hide];
    }];
}


@end
