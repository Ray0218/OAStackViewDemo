//
//  SecondTableViewController.m
//  OAStackViewDemo
//
//  Created by Ray on 16/1/12.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "SecondTableViewController.h"
#import "DPFirstIndexCell.h"

@interface SecondTableViewController ()

@end

@implementation SecondTableViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.tableView registerClass:[DPSecondIndexCell class] forCellReuseIdentifier:@"DPSecondIndexCell"];

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"待支付" ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2 ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *Indetify = @"DPSecondIndexCell";
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
    
    cell.textLabel.text = [NSString stringWithFormat:@"第二个页面== %zd",indexPath.row] ;
    return cell ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44 ;
}


@end
