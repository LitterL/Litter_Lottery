//这里面都是关于  Color的一些方法

#import "UIColor+LJY_LitterL.h"

@implementation UIColor (LJY_LitterL)

/**
 *  随机颜色
 *
 */
+ (UIColor *)L_randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
