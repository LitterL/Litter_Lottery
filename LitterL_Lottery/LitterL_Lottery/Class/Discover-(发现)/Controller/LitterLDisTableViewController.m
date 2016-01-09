//发现控制器

#import "LitterLDisTableViewController.h"

@interface LitterLDisTableViewController ()

@end

@implementation LitterLDisTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    隐藏滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
}

/**
 *  每一行将显示的时候调用
 *
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.transform = CGAffineTransformMakeTranslation(self.view.bounds.size.width,0);
    [UIView animateWithDuration:0.1 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}
@end
