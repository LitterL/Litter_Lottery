//这里面都是关于  UIView的一些方法

#import <UIKit/UIKit.h>

@interface UIView (LJY_LitterL)
//Frame  X
@property(nonatomic,assign) CGFloat x;
//Frame  Y
@property(nonatomic,assign) CGFloat y;
//Frame  Width
@property(nonatomic,assign) CGFloat width;
//Frame  Height
@property(nonatomic,assign) CGFloat height;


/**
 *  通过坐标位置移动控件
 *
 *  @param point    坐标
 *  @param duration 时间
 */
- (void)L_animateWithPoint:(CGPoint)point Duration:(NSTimeInterval)duration;
/**
 *  通过坐标位置动画隐藏控件
 *
 *  @param point    坐标
 *  @param duration 时间
 */
- (void)L_animateHideWithPoint:(CGPoint)point Duration:(NSTimeInterval)duration;


/**
 *  通过坐标和大小进行控件的移动以及缩放
 *
 *  @param point    坐标
 *  @param size     大小
 *  @param duration 时间
 */
- (void)L_animateWithPoint:(CGPoint)point Size:(CGSize)size Duration:(NSTimeInterval)duration;

/**
 *  通过给的布尔值  判断是先缩小还是先放大  执行一段放大缩小的动画效果 yes 为放大  no 为缩小
 *
 *  @param frame    Frame的大小
 *  @param movesize    扩大的多少
 *  @param duration 时间
 *  @param order    排序   yes 为放大  no 为缩小
 */
- (void)L_animateWithFrame:(CGRect)frame Movesize:(double) movesize Duration:(NSTimeInterval)duration Order:(BOOL)order;


@end
