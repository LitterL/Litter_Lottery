//自定义CollectionViewCell

#import <UIKit/UIKit.h>

@interface LitterLCollectionViewCell : UICollectionViewCell
//定义一个image  用来接受外界的图片
@property(nonatomic,weak) UIImage *image;

/**
 *  用户传了参数  看是否为最后一页 然后显示button
 *
 *  @param indexPath 当前用户页面数
 *  @param count     所有页面数
 */
-(void)selectIndex:(NSIndexPath *)indexPath count:(int)count;
@end
