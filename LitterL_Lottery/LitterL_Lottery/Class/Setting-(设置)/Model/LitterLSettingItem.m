//每一行数据

#import "LitterLSettingItem.h"


@implementation LitterLSettingItem
/**
 *  类方法  创建新的对象
 *
 *  @param image 图片
 *  @param title 标题
 *
 */
+(instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title{
    LitterLSettingItem *item = [[self alloc]init];
    item.image = image;
    item.title = title;
    
    return item;
}
@end
