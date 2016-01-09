//每一行数据

#import <Foundation/Foundation.h>

@interface LitterLSettingItem : NSObject
//用来存储图片属性
@property(nonatomic,weak) UIImage  *image;
//用来存储标题属性
@property(nonatomic,strong) NSString *title;


/** 点击这一行cell要做的事情*/
@property (nonatomic ,copy) void(^operationBlock)(NSIndexPath *indexPath);


/**
 *  类方法  创建新的对象
 *
 *  @param image 图片
 *  @param title 标题
 *
 */
+(instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title;
@end
