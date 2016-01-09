//新特性控制器



#import "LitterLCollectionViewController.h"
#import "LitterLCollectionViewCell.h"

@interface LitterLCollectionViewController ()
//guide图片
@property(nonatomic,weak) UIImageView *guideimage;
//guideLargeText图片
@property(nonatomic,weak) UIImageView *guideLargeText;
//guideSmallText图片
@property(nonatomic,weak) UIImageView *guideSmallText;
//用来记录上一次的坐标
@property(nonatomic,assign) CGFloat lastoffset;
@end

@implementation LitterLCollectionViewController

//初始化CollectionView给它赋值一个视图布局 并一些设值操作
-(instancetype)init{
    
    UICollectionViewFlowLayout  *layou = [[UICollectionViewFlowLayout alloc]init];
    
    layou.itemSize = [UIScreen mainScreen].bounds.size;
    layou.minimumLineSpacing=0;
    layou.minimumInteritemSpacing = 0;
    layou.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:layou];
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // 注册自定义CollectionViewCell
    [self.collectionView registerClass:[LitterLCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    //    设置属性
    [self setAttribute];
    //    添加子View视图
    [self childView];
    
}
/**
 *  设置属性
 */
-(void)setAttribute{
    //    让其没有弹簧效果
    self.collectionView.bounces = NO;
    //    横向没有滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //    具有分页效果
    self.collectionView.pagingEnabled=YES;
}
/**
 *  添加子视图
 */
-(void)childView{
    //    设置线条View并且添加到CollectionView上面去
    UIImageView *guideLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.x -=150;
    [self.collectionView addSubview:guideLine];
    
    //    设置图片guid并且添加到CollectionView上面去  并记录用于下一页改变Frame和image
    UIImageView *guidimage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    guidimage.center = CGPointMake(self.collectionView.width * 0.5, self.collectionView.height * 0.45);
    [self.collectionView addSubview:guidimage];
    //    记录
    self.guideimage = guidimage;
    
    //    设置图片guideLargeText并且添加到CollectionView上面去  并记录用于下一页改变Frame和image
    UIImageView *guideLargeText = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    guideLargeText.center = CGPointMake(self.collectionView.width * 0.5, self.collectionView.height * 0.7);
    [self.collectionView addSubview:guideLargeText];
    //    记录
    self.guideLargeText = guideLargeText;
    
    //    设置图片guideSmallText并且添加到CollectionView上面去  并记录用于下一页改变Frame和image
    UIImageView *guideSmallText = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    guideSmallText.center = CGPointMake(self.collectionView.width * 0.5, self.collectionView.height * 0.8);
    [self.collectionView addSubview:guideSmallText];
    //    记录
    self.guideSmallText = guideSmallText;
}

/**
 *  scroll减速的时候执行
 *
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //    获取移动的X坐标
    CGFloat offsetx = scrollView.contentOffset.x;
    //    移动的坐标减去上一次的坐标
    CGFloat doffset = offsetx - self.lastoffset;
    //    查看当前页数   第一页时  offsetx是为0的  所以要加上1
    int page = offsetx / self.view.width + 1;
    
    //    ------------------改变子视图的图片
    
    //    每一页的guid的图片
    NSString *guidimage = [NSString stringWithFormat:@"guide%d",page];
    self.guideimage.image = [UIImage imageNamed:guidimage];
    //    每一页的guideLargeText的图片
    NSString *guideLargeText = [NSString stringWithFormat:@"guideLargeText%d",page];
    self.guideLargeText.image = [UIImage imageNamed:guideLargeText];
    //    每一页的guideSmallText的图片
    NSString *guideSmallText = [NSString stringWithFormat:@"guideSmallText%d",page];
    self.guideSmallText.image = [UIImage imageNamed:guideSmallText];
    
    
    //    ------------------改变子视图的Frame
    self.guideimage.x +=2 * doffset;
    self.guideLargeText.x +=2 * doffset;
    self.guideSmallText.x +=2 * doffset;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.guideimage.x -=doffset;
        self.guideLargeText.x -= doffset;
        self.guideSmallText.x -= doffset;
    }];
    //    记录坐标
    self.lastoffset = offsetx;
}



#pragma mark <UICollectionViewDataSource>
//集合视图的数量 默认返回1
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//每一个集合视图显示的个数4
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //    拿到自定义CollectionViewCell
    LitterLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //    得到每一个集合视图个数的图片
    NSString *barimage = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item +1 ];
    UIImage *image = [UIImage imageNamed:barimage];
    //    因为图片是在自定义CollectionViewCell里面 所以交于自定义CollectionViewCell里面自己设置
    cell.image = image;
    //     用户传了参数  看是否为最后一页 然后显示button
    [cell selectIndex:indexPath count:4];
    return cell;
}@end
