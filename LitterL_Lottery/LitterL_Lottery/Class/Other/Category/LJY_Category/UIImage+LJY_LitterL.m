//这里面都是关于  UIimage的一些方法

#import "UIImage+LJY_LitterL.h"

@implementation UIImage (LJY_LitterL)

/**
 *  通过颜色获取一个图片
 *
 *  @param color 颜色
 *
 */

+ (UIImage *)L_imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}




/**
 *  通过坐标文字以及图片还有样式设置水印图片
 *
 *  @param image    图片
 *  @param str      文字
 *  @param strPoint 坐标
 *  @param dict 样式
 *
 *  @return 图片
 */
+(UIImage *)L_waterStainWithImage:(UIImage *)image Nsstring:(NSString *)str strPoint:(CGPoint)strPoint Dict:(NSMutableDictionary *)dict{
    // 开启位图上下文
    // size:位图上下文尺寸,一般由图片尺寸决定
    // opaque:不透明度 yes:不透明 no:透明.一般用不透明,因为透明很消耗性能.
    // scale:缩放比例
    UIGraphicsBeginImageContextWithOptions(image.size, YES, 0);
    //    往上下文中添加图片
    [image drawAtPoint:CGPointZero];
    //    上下文中添加文字
    [str drawAtPoint:strPoint withAttributes:dict];
    //    获取上下文中绘制的图片
    UIImage *contextImage =  UIGraphicsGetImageFromCurrentImageContext();
    //    关闭上下文
    UIGraphicsEndImageContext();
    
    return contextImage;
}

/**
 *  图片不要渲染
 *
 *  @param name 图片名字
 *
 *  @return 不要渲染的图片
 */
+ (UIImage *)L_imageWithRenderingName:(NSString *)name{
    UIImage *image =  [UIImage imageNamed:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

/**
 *  通过中部拉升为圆弧图片(不模糊)
 *
 *  @param name 图片名字
 *
 *  @return 圆弧图片
 */
+(UIImage *)L_resizableImageWithCapInsets:(NSString *)name{
    UIImage *image =  [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.5, image.size.height * 0.5, image.size.width * 0.5)];
    return image;
}

@end
