//
//  SettingLauncher.m
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 23/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import "SettingLauncher.h"
#import "SettingCell.h"
#import "Setting.h"


@interface SettingLauncher(){
    CGFloat cellHeight;
}
@property (nonatomic , strong) UIView *blackView;
@property (nonatomic , strong) UICollectionView *bottomUpMenu;
@property (nonatomic , strong) NSArray<Setting *> *settingItems;

@end

@implementation SettingLauncher



-(UICollectionView *)bottomUpMenu{
    if(!_bottomUpMenu){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _bottomUpMenu = [[UICollectionView alloc] initWithFrame: CGRectZero collectionViewLayout:layout];
        _bottomUpMenu.backgroundColor = [UIColor whiteColor];
        }
    return _bottomUpMenu;
}

-(NSArray<Setting *> *)settingItems{
    if(!_settingItems){
        
        
        Setting *setting1 = [[Setting alloc] initWithSettingName: @"Setting" settingImageName:@"profileImageView"];;
        Setting *setting2 = [ [Setting alloc] initWithSettingName:@"Term & privacy policy" settingImageName:@"business"];
        Setting *setting3 = [ [Setting alloc] initWithSettingName:@"Sending Feebback" settingImageName:@"sales"];
        Setting *setting4 = [ [Setting alloc]initWithSettingName:@"Help" settingImageName:@"products"];
        Setting *setting5 = [ [Setting alloc] initWithSettingName:@"Switch Account" settingImageName:@"ngo"];
         Setting *setting6 = [ [Setting alloc] initWithSettingName:@"Cancel" settingImageName:@"profileImageView"];
        
        _settingItems =[[NSArray<Setting *> alloc] initWithObjects: setting1 , setting2 , setting3 , setting4 , setting5 , setting6, nil];
        
    }
    
    return _settingItems;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // start doing something here maybe....
        cellHeight = 50;
        self.bottomUpMenu.dataSource = self;
        self.bottomUpMenu.delegate = self;
        
        [self.bottomUpMenu registerClass: SettingCell.self forCellWithReuseIdentifier: @"SlideMenu"];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.settingItems count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SettingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"SlideMenu" forIndexPath: indexPath];
    
    cell.setting = self.settingItems[indexPath.item];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [self handleDismiss: self.settingItems[indexPath.item]];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return  CGSizeMake(collectionView.frame.size.width, cellHeight);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


-(void)showSettings{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    if (window == [[UIApplication sharedApplication] keyWindow]){
        self.blackView = [[UIView alloc]init];
        self.blackView.backgroundColor = [UIColor colorWithWhite: 0 alpha: 0.5];
       
        [self.blackView addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(handleDismiss:)]  ];
        
       
        
        [window addSubview: self.blackView];
        // add bottomUpMenu after the blackView otherwise blackView is on top and bottomUpMenu below.
        [window addSubview: self.bottomUpMenu];
        
        CGFloat height = self.settingItems.count * cellHeight;
        CGFloat y = window.frame.size.height - height;
        self.bottomUpMenu.frame = CGRectMake(0, window.frame.size.height,  window.frame.size.width, height);
        
        self.blackView.frame = window.frame;
         self.blackView.alpha = 0.0;
        
        
        [UIView animateWithDuration:0.5 delay: 0 usingSpringWithDamping: 1 initialSpringVelocity: 1 options: UIViewAnimationOptionCurveEaseOut animations:^{
            self.blackView.alpha = 1.0;
            self.bottomUpMenu.frame = CGRectMake(0, y,  self.bottomUpMenu.frame.size.width, self.bottomUpMenu.frame.size.height);
        } completion: nil];
        
       
        
        
    }
  
}

-(void)handleDismiss : (Setting *)setting{
    
    
    [UIView animateWithDuration:0.5 delay: 0 usingSpringWithDamping: 1 initialSpringVelocity: 1 options: UIViewAnimationOptionCurveEaseOut animations:^{
        self.blackView.alpha = 0.0;
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        
        if (window == [[UIApplication sharedApplication] keyWindow]){
            self.bottomUpMenu.frame = CGRectMake( 0 , window.frame.size.height, self.bottomUpMenu.frame.size.width,
                                                 self.bottomUpMenu.frame.size.height);
        }
    } completion:^(BOOL finished) {
        
       if(![setting.settingName  isEqual: @""] && ![setting.settingName  isEqual: @"Cancel"]){
                
                [self.viewController showControllerForSetting: setting];
                
            }
       
    }];
   
}


@end
