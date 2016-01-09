//自定义tabBarButton按钮

#import <UIKit/UIKit.h>
@class LitterLtabBarButton;
@protocol tabBarButtonDelegate <NSObject>

-(void)tabBarButton:(LitterLtabBarButton *)tabBar selectIndex:(NSInteger)index;
@end

@interface LitterLtabBarButton : UIView
//用来创建tabBar的主要集合
@property(nonatomic,strong) NSArray *items;
//创建代理
@property(nonatomic,weak) id<tabBarButtonDelegate> delegate;
@end
