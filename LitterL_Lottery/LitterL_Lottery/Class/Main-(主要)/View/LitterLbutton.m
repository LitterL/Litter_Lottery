//创建自定义的button   主要作用是去除高亮

#import "LitterLbutton.h"

@implementation LitterLbutton
/**
 *  主要作用取消高亮  就是重写setHighlighted方法  不调用父类方法即可
 *
 */
-(void)setHighlighted:(BOOL)highlighted{}

@end
