//自定义的TitleView使用的按钮

#import "LitterLDisChildTitleBtn.h"

@implementation LitterLDisChildTitleBtn

/**
 *  因为外部设置了按钮图片  我们需要实现父类的方法
 *
 */
-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self sizeToFit];
}

/**
 *  因为外部设置了按钮标题  我们需要实现父类的方法
 *
 */
-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self sizeToFit];
}
/**
 *  设置button的位置
 */
-(void)layoutSubviews{
    [super layoutSubviews];
//    如果图片的坐标小于文字   那么让他们的坐标交换
    if (self.imageView.x<self.titleLabel.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x= CGRectGetMaxX(self.titleLabel.frame);
    }
}

@end
