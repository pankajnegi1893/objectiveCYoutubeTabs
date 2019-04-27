//
//  VideoCell.m
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 16/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import "VideoCell.h"
#import "UIView+UIViewExtension.h"

@interface  VideoCell()
@property (strong, nonatomic) UIImageView *thumbImageView;
@property (strong , nonatomic) UIView *separatorView;
@property (strong , nonatomic) UIImageView *profileImageView;
@property (strong , nonatomic) UILabel *titleLabel;
@property (strong , nonatomic) UITextView *subtitleTextView;
@property (strong , nonatomic)  NSLayoutConstraint *titleLabelHeightConstraint;

@end

@implementation VideoCell


-(void)setVideos:(Videos *)videos{
    self.titleLabel.text = videos.videoTitle;
    self.thumbImageView.image = [UIImage imageNamed: videos.thumnailsImage];
    
    self.profileImageView.image = [UIImage imageNamed: videos.channel.profileImageName];
    
    NSNumberFormatter *numberForatter = [NSNumberFormatter new];
    numberForatter.numberStyle = NSNumberFormatterDecimalStyle;
    self.subtitleTextView.text =[NSString stringWithFormat: @"%@ %@ views 2 years Ago" , videos.channel.name ,
                                 [numberForatter stringFromNumber: videos.numberofViews]];
    
    // measure the titleText
    CGSize size = CGSizeMake( self.frame.size.width - 16 - 44 - 8 - 16,  1000);
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize: 14]};
    CGRect estimateRect = [[NSString stringWithString: videos.videoTitle] boundingRectWithSize: size options:NSStringDrawingUsesLineFragmentOrigin attributes: attributes context: nil];
    
    if(estimateRect.size.height > 20){
        self.titleLabelHeightConstraint.constant = 44;
    }else{
        self.titleLabelHeightConstraint.constant = 20;
    }
    
   // [[NSString stringWithString: videos.videoTitle] boundingRectWithSize: size options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSFontAttributeName : [UIFont systemFontOfSize: 14]] context:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpViews];
    }
    return self;
}
-(UIImageView *)thumbImageView{
    if(!_thumbImageView){
        _thumbImageView = [[UIImageView alloc] init];
        _thumbImageView.image = [UIImage imageNamed: @"thumnail_ImageView"];
        _thumbImageView.contentMode = UIViewContentModeScaleAspectFill;
        // clip the imageView bounds so that it not merged with the other Views
        _thumbImageView.clipsToBounds = YES;
        
    }
    
    return _thumbImageView;
}

-(UIView *)separatorView{
    if(!_separatorView){
        _separatorView= [[UIView alloc] init];
        _separatorView.backgroundColor = [UIColor colorWithRed: 230.0f/255.0f
                                                         green: 230.0f/255.0f blue: 230.0f/255.0f alpha: 1.0f];
        
    }
    
    return _separatorView;
}

-(UIImageView *)profileImageView{
    if(!_profileImageView){
        _profileImageView= [[UIImageView alloc] init];
         _profileImageView.image = [UIImage imageNamed: @"profileImageView"];
        // to make Image Circle
        _profileImageView.layer.cornerRadius = 22; // bcz image width height is 44
        _profileImageView.layer.masksToBounds =  YES;
    }
    
    return _profileImageView;
}

-(UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"ObjectiveC Tutorial :- Youtube";
        _titleLabel.numberOfLines = 2;
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return  _titleLabel;
}
-(UITextView *)subtitleTextView{
    if(!_subtitleTextView){
        _subtitleTextView = [[UITextView alloc]init];
        _subtitleTextView.text = @"This is the Description of the Video, Bingo !!!!";
        _subtitleTextView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0);
        _subtitleTextView.textColor = [UIColor lightGrayColor];
        _subtitleTextView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return  _subtitleTextView;
}





-(void) setUpViews {
    
    [self addSubview: self.thumbImageView];
    [self addSubview: self.separatorView];
    [self addSubview: self.profileImageView];
    [self addSubview: self.titleLabel];
    [self addSubview: self.subtitleTextView];
    
    // add Constraint to the Layout :-
    // The documented rule for this type of method is that the last argument must be nil.
    [self addConstraintsWithFormat: @"H:|-16-[v0]-16-|" views:self.thumbImageView , nil];
    [self addConstraintsWithFormat: @"H:|[v0]|" views: self.separatorView, nil];
    [self addConstraintsWithFormat: @"H:|-16-[v0(44)]|"  views:self.profileImageView , nil];
    
     // This is vertical Constraints
    [self addConstraintsWithFormat: @"V:|-16-[v0]-8-[v1(44)]-28-[v2(1)]|"  views:self.thumbImageView , self.profileImageView ,
     self.separatorView , nil];
   
   // Top Constraint titleLabel
    [self addConstraint: [NSLayoutConstraint constraintWithItem:self.titleLabel attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: self.thumbImageView attribute: NSLayoutAttributeBottom multiplier: 1 constant: 8]];
    // left Constraint titleLabel
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.titleLabel attribute: NSLayoutAttributeLeft relatedBy: NSLayoutRelationEqual toItem: self.profileImageView attribute: NSLayoutAttributeRight multiplier: 1 constant: 8]];
    // right Constraint titleLabel
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.titleLabel attribute: NSLayoutAttributeRight relatedBy: NSLayoutRelationEqual toItem: self.thumbImageView attribute: NSLayoutAttributeRight multiplier: 1 constant: 0]];
    
    // height constraint titleLabel
    self.titleLabelHeightConstraint = [NSLayoutConstraint constraintWithItem: self.titleLabel attribute: NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem: self attribute: NSLayoutAttributeHeight multiplier: 0 constant: 44];
    [self addConstraint: self.titleLabelHeightConstraint];
   

    // Top Constraint subtitleTextView
    [self addConstraint: [NSLayoutConstraint constraintWithItem:self.subtitleTextView attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: self.titleLabel attribute: NSLayoutAttributeBottom multiplier: 1 constant: 4]];
    // left Constraint subtitleTextView
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.subtitleTextView attribute: NSLayoutAttributeLeft relatedBy: NSLayoutRelationEqual toItem: self.profileImageView attribute: NSLayoutAttributeRight multiplier: 1 constant: 8]];
    // right Constraint subtitleTextView
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.subtitleTextView attribute: NSLayoutAttributeRight relatedBy: NSLayoutRelationEqual toItem: self.thumbImageView attribute: NSLayoutAttributeRight multiplier: 1 constant: 0]];
    
    // height constraint subtitleTextView
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.subtitleTextView attribute: NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem: self attribute: NSLayoutAttributeHeight multiplier: 0 constant: 20]];
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [NSException raise:@"InitNotImplemented" format:@"Init(Coder) has not been implemented "];
    }
    return self;
}

@end
