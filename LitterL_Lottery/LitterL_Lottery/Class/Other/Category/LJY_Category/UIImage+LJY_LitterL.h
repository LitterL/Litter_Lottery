//这里面都是关于  UIimage的一些方法

#import <UIKit/UIKit.h>

@interface UIImage (LJY_LitterL)
/**
 *  通过颜色获取一个图片
 *
 *  @param color 颜色
 *
 */
+ (UIImage *)L_imageWithColor:(UIColor *)color;
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
+(UIImage *)L_waterStainWithImage:(UIImage *)image Nsstring:(NSString *)str strPoint:(CGPoint)strPoint Dict:(NSMutableDictionary *)dict;
/**
 *  图片不要渲染
 *
 *  @param name 图片名字
 *
 *  @return 不要渲染的图片
 */
+ (UIImage *)L_imageWithRenderingName:(NSString *)name;

/**
 *  通过中部拉升为圆弧图片(不模糊)
 *
 *  @param name 图片名字
 *
 *  @return 圆弧图片
 */
+(UIImage *)L_resizableImageWithCapInsets:(NSString *)name;
@end
