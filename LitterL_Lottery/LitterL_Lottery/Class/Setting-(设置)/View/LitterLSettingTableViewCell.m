//自定义的每一个Cell

#import "LitterLSettingTableViewCell.h"
#import "LitterLSettingItem.h"
#import "LitterLArrowSetting.h"
#import "LitterLSwtchSetting.h"

@implementation LitterLSettingTableViewCell

//类方法 创建一个Cell对象
+(id)settingTable:(UITableView *)tableView{
    NSString * const reuseIdentifier = @"Cell";
    LitterLSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell =[[ LitterLSettingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    return cell;
}

/**
 *  有值后直接给属性赋值  那么就能展示出来了
 *
 */
-(void)setItems:(LitterLSettingItem *)items{
    _items = items;
    self.imageView.image = items.image;
    self.textLabel.text = items.title;
    [self setupRightView];
}
/**
 *  通过子类来判断  右边显示what
 */
-(void)setupRightView{
    //    判断是否为有箭头的那个
    if([self.items isKindOfClass:[LitterLArrowSetting class]]){
        //        设置图片
        self.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
//                arrow.desvc
        //判断是否为单选按钮
    }else if ([self.items isKindOfClass:[LitterLSwtchSetting class]]){
        //        设置按钮
        LitterLSwtchSetting *swtchclass = (LitterLSwtchSetting *)_items;
        UISwitch *switc = [[UISwitch alloc]init];
        switc.on =swtchclass.open;
        self.accessoryView = switc;
        //如果什么都没有
    }else{
        self.accessoryView = nil;
    }
    
}


@end
