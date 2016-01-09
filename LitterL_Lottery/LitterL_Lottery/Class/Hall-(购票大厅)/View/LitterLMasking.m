//蒙版界面

#import "LitterLMasking.h"

@implementation LitterLMasking


/**
 *  蒙版弹出
 */
+(void)show{
//    创建对象 并且赋值坐标
    LitterLMasking *mask = [[LitterLMasking alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    蒙版的颜色为黑色
    mask.backgroundColor = [UIColor blackColor];
//    设置通明度为原来的0.7  默认为1
    mask.alpha = 0.7;
//    最后添加到window上面
    [keyWindow addSubview:mask];
}
/**
 *  蒙版隐藏
 */
+(void)hide{
//    循环判断window上面的子控件  如果是蒙版的话就移除它  然后跳出
    for (UIView *view in keyWindow.subviews) {
        if ([view isKindOfClass:[LitterLMasking class]]) {
            [view removeFromSuperview];
            break;
        }
    }
}
@end
