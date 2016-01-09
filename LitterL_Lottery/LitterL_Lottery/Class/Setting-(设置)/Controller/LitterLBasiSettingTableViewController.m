//所有tablecontroller用的父类

#import "LitterLBasiSettingTableViewController.h"
#import "LitterLSettingTableViewCell.h"
#import "LitterLSettingGroup.h"
#import "LitterLSettingItem.h"
#import "LitterLArrowSetting.h"

@interface LitterLBasiSettingTableViewController ()

@end

@implementation LitterLBasiSettingTableViewController


/**
 *  懒加载   迫使items唯一
 *
 */
-(NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    LitterLSettingGroup *item = self.items[section];
    return item.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    调用类方法的到cell
    LitterLSettingTableViewCell *cell = [LitterLSettingTableViewCell settingTable:tableView];
    //    得到行数据  传给Cell  最后返回cell
    LitterLSettingGroup *itemgroup = self.items[indexPath.section];
    LitterLSettingItem *item = itemgroup.items[indexPath.row];
    cell.items = item;
    return cell;
}
//返回组头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    LitterLSettingGroup *group = self.items[section];
    return group.headTitle;
}
//返回组尾标题
-( NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    LitterLSettingGroup *group = self.items[section];
    return group.footerTitle;
}
//选中Cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LitterLSettingGroup *group = self.items[indexPath.section];
    LitterLSettingItem *item = group.items[indexPath.row];
//    如果block里面有值就执行
    if (item.operationBlock) {
        item.operationBlock(indexPath);
//    如果是push类   就转换
    }else if ([item isKindOfClass:[LitterLArrowSetting class]]) {
        LitterLArrowSetting *items= (LitterLArrowSetting *)item;
//        如果push有控制器 那么就push过去
        if(items.desvc){
            [self.navigationController pushViewController:[[items.desvc alloc]init] animated:YES];
        }
    }
}

@end
