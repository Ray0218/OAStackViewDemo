//
//  DPFirstView.m
//  OAStackViewDemo
//
//  Created by Ray on 15/12/28.
//  Copyright © 2015年 Ray. All rights reserved.
//

#import "DPFirstView.h"


@interface DPFirstView ()

@end

@implementation DPFirstView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.tableView registerClass:[DPFirstIndexCell class] forCellReuseIdentifier:@"DPFirstIndexCell"];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 50 ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *Indetify = @"DPFirstIndexCell";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:Indetify forIndexPath:indexPath] ;
    //[tableView dequeueReusableCellWithIdentifier:Indetify ] ;
    //    if (cell == nil) {
    //        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetify];
    //        cell.textLabel.font = [UIFont systemFontOfSize:16] ;
    //        cell.backgroundView = ({
    //            UIView *view = [[UIView alloc]init];
    //            view.backgroundColor = [UIColor clearColor] ;
    //            view ;
    //        }) ;
    //        cell.textLabel.backgroundColor =
    //        cell.backgroundColor =
    //        cell.contentView.backgroundColor = [UIColor clearColor] ;
    //    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第一个页面== %zd",indexPath.row] ;
    return cell ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44 ;
}


@end
