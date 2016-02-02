//
//  DPFirstIndexCell.m
//  OAStackViewDemo
//
//  Created by Ray on 15/12/25.
//  Copyright © 2015年 Ray. All rights reserved.
//

#import "DPFirstIndexCell.h"

@implementation DPFirstIndexCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        
         self.contentView.backgroundColor = [UIColor clearColor] ;
        
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor blueColor] ;
        label.text = @"全部" ;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView) ;
        }];
        
        [self.contentView bringSubviewToFront:label];
    }
    return self ;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end



@implementation DPSecondIndexCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        
         self.contentView.backgroundColor = [UIColor clearColor] ;
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor yellowColor] ;
        label.text = @"待支付" ;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView) ;
        }];
    }
    return self ;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end


@implementation DPThirdIndexCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        
         self.contentView.backgroundColor = [UIColor whiteColor] ;
                
        [self builLayout];
    }
    return self ;
}

-(void)builLayout{

    DPAccountView * view = [[DPAccountView alloc]initWithWidthArray:@[@(56.4*1.7), @56.4, @56.4, @(56.4*1.3)] whithHigh:25 backColor:[UIColor colorWithRed:0.93 green:0.94 blue:0.95 alpha:1]];
    [view setTitles:@[@"金额/元" , @"倍数", @"复制数", @"奖金/元"]];
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(30) ;
        make.right.equalTo(self.contentView).offset(-5) ;
        make.top.equalTo(self.contentView).offset(5) ;
        make.height.mas_equalTo(25) ;
    }];
    
    [self.contentView addSubview:self.dataView];
    [self.dataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(30) ;
        make.right.equalTo(self.contentView).offset(-5) ;
        make.top.equalTo(view.mas_bottom).offset(1) ;
        make.height.mas_equalTo(25) ;
    }];
    
    [self.contentView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView) ;
        make.left.equalTo(self.contentView).offset(15) ;
        make.width.and.height.mas_equalTo(30) ;
    }];
    
}

-(UIImageView*)iconView{

    if (_iconView == nil) {
        _iconView = [[UIImageView alloc]init];
        _iconView.backgroundColor = [UIColor greenColor] ;
        _iconView.layer.cornerRadius = 15 ;
    }
    
    return _iconView ;
}

-(DPAccountView*)dataView{

    if (_dataView == nil) {
        _dataView = [[DPAccountView alloc]initWithWidthArray:@[@(56.4*1.7), @56.4, @56.4, @(56.4*1.3)] whithHigh:25 backColor:[UIColor colorWithRed:0.96 green:0.98 blue:0.98 alpha:1]];
        [_dataView changeTextColorWithIndex:3 color:[UIColor redColor]] ;
     }
    
    return _dataView ;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end



@implementation DPFouthIndexCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        
         self.contentView.backgroundColor = [UIColor clearColor] ;
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor yellowColor] ;
        label.text = @"中奖" ;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView) ;
        }];
    }
    return self ;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

@implementation DPFiveIndexCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        
         self.contentView.backgroundColor = [UIColor clearColor] ;
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor yellowColor] ;
        label.text = @"好友" ;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView) ;
        }];
    }
    return self ;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
