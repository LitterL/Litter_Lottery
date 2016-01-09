//自定义CollectionViewCell

#import "LitterLCollectionViewCell.h"
#import "LitterLTabBarController.h"

@interface LitterLCollectionViewCell()
//添加到自定义CollectionViewCell的背景图片  用UIImageView代替
@property(nonatomic,weak) UIImageView *backimage;
//添加到自定义CollectionViewCell最后一页的button
@property(nonatomic,weak) UIButton *backbtn;
@end

@implementation LitterLCollectionViewCell

/**
 *  外部设置image的时候 把image赋值给UIImageView   并显示在窗体上面
 *
 */
-(void)setImage:(UIImage *)image{
    _image = image;
    self.backimage.image = image;
}
/**
 *  懒加载image 并且附上Frame
 *
 */
-(UIImageView *)backimage{
//    如果为空  就创建
    if (!_backimage) {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:self.bounds];
        _backimage = imageview;
        [self.contentView addSubview:imageview];
    }
    return _backimage;
}


/**
 *   懒加载image 并且附上Frame
 *
 */
-(UIButton *)backbtn{
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
    //    大小随机
    [button sizeToFit];
//    设置point
    button.center = CGPointMake(self.width*0.5, self.height * 0.9);
    self.backbtn = button;
    [self.contentView addSubview:button];
//    注册事假
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchDown];
    return _backbtn;
}
/**
 *  事件
 */
-(void)btnClick{
//    项目控制器
    LitterLTabBarController *tab = [[LitterLTabBarController alloc]init];
//    放在跟控制器上面
      keyWindow.rootViewController = tab;
}

/**
 *  用户传了参数  看是否为最后一页 然后显示button
 *
 *  @param indexPath 当前用户页面数
 *  @param count     所有页面数
 */

-(void)selectIndex:(NSIndexPath *)indexPath count:(int)count{
//    如果等于最后一页的时候
    if(indexPath.item == count-1)
    {
        self.backbtn.hidden = NO;
    }else{
        self.backbtn.hidden = YES;
    }
    
}





@end
