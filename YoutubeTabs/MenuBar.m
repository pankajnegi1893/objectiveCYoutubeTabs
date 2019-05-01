//
//  MenuBar.m
//  YoutubeTabs
//
//  Created by Pankaj Negi on 16/06/17.
//

#import "MenuBar.h"
#import "UIColor+ColorExtension.h"
#import "UIView+UIViewExtension.h"
#import "MenuCell.h"

@interface MenuBar()



@property (nonatomic, strong) NSArray *tabImageArray;
@end

@implementation MenuBar

-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc] initWithFrame: CGRectZero collectionViewLayout: layout];
        _collectionView.backgroundColor = [UIColor rgb: 230 green: 32 blue: 31];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

-(NSArray *)tabImageArray{
    if(!_tabImageArray){
        _tabImageArray = [[NSArray alloc] initWithObjects: @"business" , @"products" , @"sales" , @"ngo", nil];
    }
    
    return  _tabImageArray;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.collectionView registerClass: MenuCell.self forCellWithReuseIdentifier: @"cellId"];
        [self addSubview: self.collectionView];
        [self addConstraintsWithFormat: @"H:|[v0]|" views: self.collectionView , nil];
        [self addConstraintsWithFormat: @"V:|[v0]|" views: self.collectionView , nil];
        
        // make first tab highlighted with black.
        NSIndexPath *defaultSelectedIndexPath = [NSIndexPath indexPathForItem: 0 inSection: 0];
        [self.collectionView selectItemAtIndexPath: defaultSelectedIndexPath animated: NO scrollPosition: UICollectionViewScrollPositionNone];
        
        [self setUpHorizontalBar];
        
    }
    return self;
}

-(void)setUpHorizontalBar{
    UIView *horizontalBarView = [[UIView alloc] init];
    horizontalBarView.translatesAutoresizingMaskIntoConstraints = NO;
    horizontalBarView.backgroundColor = [UIColor colorWithWhite: 0.95 alpha: 1];
    [self addSubview: horizontalBarView];
    // old school frame way of doing things
    //horizontalBarView.frame = [CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)];
    
    // new school way of laying out our views
    // in ios9
    // need x, y , width , height constraints
    
    self.horizontalBarLeftConstraint = [horizontalBarView.leftAnchor constraintEqualToAnchor: self.leftAnchor];
    
    self.horizontalBarLeftConstraint.active = true; // x
    [horizontalBarView.bottomAnchor constraintEqualToAnchor: self.bottomAnchor].active = true; // y
    [horizontalBarView.widthAnchor constraintEqualToAnchor: self.widthAnchor multiplier: 1.0/4.0].active = true; // width
    [horizontalBarView.heightAnchor constraintEqualToConstant: 4].active = true; //height
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
//    NSLog( @"%ld" , (long)indexPath.item);
//    CGFloat x = (CGFloat)indexPath.item * self.frame.size.width / 4;
//    
//    self.horizontalBarLeftConstraint.constant = x;
//    
//    [UIView animateWithDuration: 0.75 delay: 0 usingSpringWithDamping: 1 initialSpringVelocity: 1 options: UIViewAnimationOptionCurveEaseOut animations:^{
//        [self layoutIfNeeded];
//    } completion: nil];
    
    [ self.viewController scrollToMenuIndex: indexPath.item];
    
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [NSException raise:@"InitNotImplemented" format:@"Init(Coder) has not been implemented "];

    }
    return self;
}

// UICollectionViewDataSource methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"cellId" forIndexPath: indexPath];

    cell.tabImageView.image = [[UIImage imageNamed: self.tabImageArray[indexPath.row]] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    cell.tintColor = [UIColor rgb: 255 green: 255 blue: 255];
    return  cell;
}


// UICollectionViewDelegateFlowLayout methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return  CGSizeMake(self.frame.size.width / 4,  self.frame.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

@end
