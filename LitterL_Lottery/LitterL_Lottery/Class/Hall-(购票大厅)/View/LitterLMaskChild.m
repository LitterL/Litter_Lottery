//蒙版中的子视图  小苹果

#import "LitterLMaskChild.h"

@interface LitterLMaskChild()

@end

@implementation LitterLMaskChild
/**
 *  通过给予的坐标显示小苹果   因为需要设置代理所以返回小苹果
 *
 *  @param point 坐标
 */
+(LitterLMaskChild *)showWithCenter:(CGPoint)point{
//    加载xib文件
    LitterLMaskChild *maskchild = [[[NSBundle mainBundle] loadNibNamed:@"LitterLMaskChild" owner:nil options:nil]lastObject];
//    设置它的坐标
    maskchild.center = point;
//    添加到窗口
    [keyWindow addSubview:maskchild];
//    返回小苹果
    return maskchild;
}

/**
 *  移除小苹果  因为关闭按钮在它自己本身  所以使用对象方法
 */
-(void)hideWithPoint:(CGPoint)point completaion:(MyBLock)completaion{
//    先动画移动小苹果    执行完后在执行block里面的内容
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.center = point;
    } completion:^(BOOL finished) {
//        移除小苹果
        [self removeFromSuperview];
//        执行blcok
        completaion();
    }];
}

/**
 *  关闭按钮
 *
 */
- (IBAction)closeClick:(id)sender {
//    点击关闭按钮的时候 看外部是否实现代理  是则调用代理方法
    if([self.delegate respondsToSelector:@selector(MaskChild:)]){
        [self.delegate MaskChild:self];
    }
        
}



@end
