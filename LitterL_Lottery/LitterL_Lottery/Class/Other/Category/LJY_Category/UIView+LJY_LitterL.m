//这里面都是关于  UIView的一些方法

#import "UIView+LJY_LitterL.h"

@implementation UIView (LJY_LitterL)


/**
 *  关于坐标的操作
 *
 */
#pragma mark -设置坐标位置  Setting Frame

/**
 *  X轴坐标  Frame X
 */
-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x{
    return self.frame.origin.x;
}

/**
 *  Y轴坐标  Frame Y
 */
-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)y{
    return self.frame.origin.y;
}
/**
 *  宽度  Width
 */
-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width{
    return self.frame.size.width;
}
/**
 *  高度  Height
 */
-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-(CGFloat)height{
    return self.frame.size.height;
}

#pragma mark -关于常用方法的操作
/**
 *  通过坐标位置移动控件
 *
 *  @param point    坐标
 *  @param duration 时间
 */
- (void)L_animateWithPoint:(CGPoint)point Duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        self.frame =CGRectMake(point.x, point.y, self.width, self.height);
    }];
}
/**
 *  通过坐标位置动画隐藏控件
 *
 *  @param point    坐标
 *  @param duration 时间
 */
- (void)L_animateHideWithPoint:(CGPoint)point Duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        self.frame =CGRectMake(point.x, point.y, 0, 0);
    }];
}
/**
 *  通过坐标和大小进行控件的移动以及缩放
 *
 *  @param point    坐标
 *  @param size     大小
 *  @param duration 时间
 */
- (void)L_animateWithPoint:(CGPoint)point Size:(CGSize)size Duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        self.frame =CGRectMake(point.x, point.y, size.width, size.height);
    }];
    
}

/**
 *  通过给的布尔值  判断是先缩小还是先放大  执行一段放大缩小的动画效果 yes 为放大  no 为缩小
 *
 *  @param frame    Frame的大小
 *  @param movesize    扩大的多少
 *  @param duration 时间
 *  @param order    排序   yes 为放大  no 为缩小
 */

- (void)L_animateWithFrame:(CGRect)frame Movesize:(double) movesize Duration:(NSTimeInterval)duration Order:(BOOL)order{
    CGRect frameto = self.frame;
    if (order) {
        [UIView animateWithDuration:duration animations:^{
            self.frame =CGRectMake(frame.origin.x-movesize, frame.origin.y-movesize, frame.size.width+movesize*2, frame.size.height+movesize*2);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:duration animations:^{
                self.frame =frameto;
            }];
        }];
    }else{
        [UIView animateWithDuration:duration animations:^{
            self.frame =CGRectMake(frame.origin.x+movesize, frame.origin.y+movesize, frame.size.width-movesize*2, frame.size.height-movesize*2);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:duration animations:^{
                self.frame =frameto;
            }];
        }];
    }
}



@end
