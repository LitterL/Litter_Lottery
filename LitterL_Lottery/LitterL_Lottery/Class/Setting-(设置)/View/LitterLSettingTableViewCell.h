//自定义的每一个Cell

#import <UIKit/UIKit.h>
@class LitterLSettingItem;
@interface LitterLSettingTableViewCell : UITableViewCell
//每一行的数据
@property(nonatomic,strong) LitterLSettingItem *items;

//类方法 创建一个Cell对象
+(id)settingTable:(UITableView *)tableView;
@end
