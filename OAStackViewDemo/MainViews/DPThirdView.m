//
//  DPThirdView.m
//  OAStackViewDemo
//
//  Created by Ray on 15/12/28.
//  Copyright © 2015年 Ray. All rights reserved.
//

#import "DPThirdView.h"

@implementation DPThirdView

- (instancetype)init
{
    self = [super init];
    if (self) {
     }
    return self;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5 ;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *Indetify = @"DPThirdIndexCell";
    DPThirdIndexCell *cell  = [tableView dequeueReusableCellWithIdentifier:Indetify forIndexPath:indexPath] ;
    
     
    
    [cell.dataView setTitles:@[@"500000", @"2500", @"2500", @"50000000.00"]];
    return cell ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 61 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 35 ;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    static NSString *headerIndetify = @"headerIndetify" ;
    UITableViewHeaderFooterView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIndetify] ;
    if (view == nil) {
        view = [[UITableViewHeaderFooterView alloc]init];
        view.backgroundColor = [UIColor colorWithRed:0.93 green:0.95 blue:0.95 alpha:1] ;
        
        UIImageView *imgView = [[UIImageView alloc ]init];
        imgView.backgroundColor = [UIColor blueColor] ;
        [view.contentView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view.contentView).offset(5) ;
            make.top.and.bottom.equalTo(view.contentView) ;
            make.width.equalTo(@10) ;
        }];
        
        
        UILabel *titlesLabel = [[UILabel alloc]init];
        titlesLabel.textAlignment = NSTextAlignmentLeft ;
        titlesLabel.font = [UIFont systemFontOfSize:15] ;
        titlesLabel.textColor = [UIColor darkGrayColor] ;
        titlesLabel.tag = 111 ;
        [view.contentView addSubview:titlesLabel];
        [titlesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgView.mas_right).offset(5) ;
            make.centerY.equalTo(view.contentView) ;
         }];
        
    }
    
    
    UILabel *lab =(UILabel*)[ view.contentView viewWithTag:111] ;
    lab.text = [NSString stringWithFormat:@"section = %zd",section] ;
    
    return view ;
}
 
@end
