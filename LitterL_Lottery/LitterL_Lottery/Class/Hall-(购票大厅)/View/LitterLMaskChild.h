//蒙版中的子视图  小苹果


#import <UIKit/UIKit.h>
//定义一个无参无返回值的blcok
 typedef void(^MyBLock)();
@class LitterLMaskChild;
@protocol MaskChildDelegate <NSObject>

//代理方法  把本身传过去 
-(void)MaskChild:(LitterLMaskChild *)child;
@end


@interface LitterLMaskChild : UIView

//代理
@property(nonatomic,weak) id<MaskChildDelegate> delegate;






/**
 *  通过给予的坐标显示小苹果   因为需要设置代理所以返回小苹果
 *
 *  @param point 坐标
 */
+(LitterLMaskChild *)showWithCenter:(CGPoint)point;
/**
 *  移除小苹果  因为关闭按钮在它自己本身  所以使用对象方法
 */
-(void)hideWithPoint:(CGPoint)point completaion:(MyBLock)completaion;

@end
