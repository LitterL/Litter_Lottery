//每一组



#import <Foundation/Foundation.h>

@interface LitterLSettingGroup : NSObject
//用来存储头标题属性
@property(nonatomic,strong) NSString *headTitle;

//用来存储头标题属性
@property(nonatomic,strong) NSString *footerTitle;

//用来存储所有的LitterLSettingItem数据
@property(nonatomic,strong) NSArray *items;



@end
