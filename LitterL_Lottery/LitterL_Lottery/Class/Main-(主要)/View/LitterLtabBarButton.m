//自定义tabBarButton按钮

#import "LitterLtabBarButton.h"
#import "LitterLbutton.h"

@interface LitterLtabBarButton ()
@property(nonatomic,weak) UIButton *btn;
@end

@implementation LitterLtabBarButton

-(void)setItems:(NSArray *)items{
    _items = items;
    //    创建button并且赋值图片
    for (UITabBarItem *item in self.items) {
        LitterLbutton *btn = [[LitterLbutton alloc]init];
        [self addSubview:btn];
        //        NSLog(@"%@",item.image);
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    }
    //获取通知中心单例对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(selectedIndex:) name:@"change" object:nil];

}

static int selectindex = 0;
/**
 *  当使用3Dtouch的时候我就改变它的selectindex
 *
 */
-(void)selectedIndex:(NSNotification *)user{
//    这里操作是为了获取index
    NSDictionary *dic = user.userInfo;
    NSString *index = dic[@"index"];
    selectindex = [index intValue];
    
//    移除通知
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}


/**
 *  每一个button的点击
 *
 */
-(void)btnClick:(UIButton *)btn{
    //    开始三步骤  取消btn上一次选择   设置现在btn为选中状态    赋值给外部的btn
    self.btn.selected= NO;
    btn.selected = YES;
    self.btn = btn;
    //    判断是否实现这个代理
    if ([self.delegate respondsToSelector:@selector(tabBarButton:selectIndex:)]) {
        //        实现了的话就调用这个代理   并且把自身  和   第几个btn传过去
        [self.delegate tabBarButton:self selectIndex:btn.tag];
    }
    
}


/**
 *  设置位置
 */
-(void)layoutSubviews{
    [super layoutSubviews];
     int i=0;
    //   宽 高 X Y
    CGFloat setW =self.width/self.items.count ;
    CGFloat setH =self.height ;
    CGFloat setX =0 ;
    CGFloat setY =0 ;
    
    //    给btn赋值坐标
    for (UIView *btn in self.subviews) {
        if([btn isKindOfClass:[UIButton class]]){
            //            X坐标等于  宽度*个数
            setX = i *setW;
            btn.frame = CGRectMake(setX, setY, setW, setH);
            //            用于主界面选中的那一个控制器
            btn.tag = i;
            //            默认选中第一个
            if(i==selectindex){
                [self btnClick:(UIButton *)btn];
                self.btn = (UIButton *)btn;
                [self.delegate tabBarButton:self selectIndex:btn.tag];
            }
            i++;
        }
    }
}



@end
