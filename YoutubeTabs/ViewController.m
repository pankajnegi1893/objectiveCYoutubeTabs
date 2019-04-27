//
//  ViewController.m
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 16/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import "ViewController.h"
#import "VideoCell.h"
#import "MenuBar.h"
#import "UIView+UIViewExtension.h"
#import "Videos.h"
#import "Channel.h"
#import "SettingLauncher.h"
#import "Setting.h"
#import "UIColor+ColorExtension.h"
#import "FeedCell.h"
#import "ProductCell.h"


@interface ViewController ()
@property (nonatomic , strong) MenuBar *menuBar;

@property (nonatomic , strong) SettingLauncher *settingLauncher;

@property(nonatomic , strong) NSArray *titleArray;

@property (nonatomic , strong)  UILabel *titleLabel ;

@end

@implementation ViewController

-(MenuBar *)menuBar{
    if(!_menuBar){
        _menuBar = [[MenuBar alloc]init];
        _menuBar.viewController = self;
    }
    return  _menuBar;
}

-(NSArray *)titleArray{
    if(!_titleArray){
        _titleArray = [NSArray arrayWithObjects: @"Business Listing" , @"Products" , @"Sales" , @"NGO", nil];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.titleLabel = [[UILabel alloc] initWithFrame: CGRectMake( 0 ,  0,
                                                                     self.view.frame.size.width - 32,
                                                                     self.view.frame.size.width)];
    self.titleLabel.text = @"  Home";
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize: 20.0f];
    
    self.navigationItem.titleView = self.titleLabel;
    
    
    
    [self setUpCollectionView];
    [self setUpMenuBar];
    [self setUpNavBarButtons];
}

-(void) setUpCollectionView{
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // remove the gap b/w each cell
    flowLayout.minimumLineSpacing = 0;
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
  //  [self.collectionView registerClass: VideoCell.self forCellWithReuseIdentifier: @"VideoCellID"];
    
  
     [self.collectionView registerClass: FeedCell.self forCellWithReuseIdentifier: @"BusinessListCellId"];
    [self.collectionView registerClass: ProductCell.self forCellWithReuseIdentifier: @"ProductCellId"];
    
    
    // to show all the VideoCell below the tabBar or MenuBar.
    self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50,  0, 0, 0);
    
    // make pageEnable so that it not stop scroll in b/w
    self.collectionView.pagingEnabled = YES;
    
    

}

-(void) setUpMenuBar{
    
    // hide the Top MenuBar or Toolbar when user Scroll
    self.navigationController.hidesBarsOnSwipe = YES;
   
    //set the redView behind the MenuBar(like it background) so whenever user scroll to bottom it not show white space when Toolbar hides
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor rgb: 230 green: 32 blue: 31 ];
    [self.view addSubview: redView];
    [self.view addConstraintsWithFormat: @"H:|[v0]|" views: redView , nil];
    [self.view addConstraintsWithFormat: @"V:[v0(50)]" views: redView , nil];
    
    //add menubar to the Layout with constraints (4 tabs)
    [self.view addSubview: self.menuBar ];
    [self.view addConstraintsWithFormat: @"H:|[v0]|" views: self.menuBar , nil];
     [self.view addConstraintsWithFormat: @"V:[v0(50)]" views: self.menuBar , nil];
    
    // constraint for hiding the Toolbar correctly (topLayoutGuide is your top most portion of you View)
    [self.menuBar.topAnchor constraintEqualToAnchor: self.topLayoutGuide.bottomAnchor].active = YES;
}

-(void) setUpNavBarButtons{
    UIImage *searchImage = [[UIImage imageNamed: @"search_icon"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *searchBarBtn = [[UIBarButtonItem alloc]initWithImage: searchImage style: UIBarButtonItemStylePlain target: self action: @selector(handleSearch)];
   
    UIImage *overflowImage = [[UIImage imageNamed: @"overflow_icon"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *overflowBarBtn = [[UIBarButtonItem alloc]initWithImage: overflowImage style: UIBarButtonItemStylePlain target: self action: @selector(handleMore)];
    
    
    NSArray<UIBarButtonItem *> *navbarButtons = [NSArray arrayWithObjects: overflowBarBtn , searchBarBtn, nil];
    self.navigationItem.rightBarButtonItems = navbarButtons;
}

-(void)handleSearch{
    NSLog(@"handleSearch");
}

-(SettingLauncher *)settingLauncher{
    if(!_settingLauncher){
        _settingLauncher = [[SettingLauncher alloc]init];
        _settingLauncher.viewController = self;
    }
    return _settingLauncher;
}

-(void)handleMore{
    NSLog(@"handleMore");
    
    [self.settingLauncher showSettings];
    
       
}

-(void)showControllerForSetting : (Setting *)setting{
    UIViewController *dummySettingViewController = [[UIViewController alloc]init];
    dummySettingViewController.view.backgroundColor = [UIColor whiteColor];
    dummySettingViewController.navigationItem.title = setting.settingName;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
   
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject: [UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    [self.navigationController pushViewController: dummySettingViewController animated: YES];
    
    
}

-(void)scrollToMenuIndex : (NSInteger)menuIndex{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:menuIndex inSection:0] ;
    [ self.collectionView scrollToItemAtIndexPath: indexPath atScrollPosition: UICollectionViewScrollPositionNone animated: YES];
    
    [self setTitleForIndex : (int)menuIndex];
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog( @"scrollViewWillEndDragging %f" , targetContentOffset->x / self.view.frame.size.width);
    
    
     CGFloat index = targetContentOffset->x / self.view.frame.size.width;
     NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0] ;
    
    [self.menuBar.collectionView selectItemAtIndexPath: indexPath animated: true scrollPosition: UICollectionViewScrollPositionNone];
    
    [self setTitleForIndex: (int)index];
    
}

-(void)setTitleForIndex : (int)index{
    self.titleLabel.text = [NSString stringWithFormat: @"  %@" , self.titleArray[(int)index]];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog( @"scrollViewDidScroll %f" , scrollView.contentOffset.x);
     NSLog(@"menuBar width :- %f " , self.menuBar.frame.size.width);
    self.menuBar.horizontalBarLeftConstraint.constant = scrollView.contentOffset.x/4;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FeedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"BusinessListCellId" forIndexPath: indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(self.view.frame.size.width,  self.view.frame.size.height - 50); // 50 is size of menuBar
}

@end



