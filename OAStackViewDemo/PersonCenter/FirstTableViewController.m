//
//  FirstTableViewController.m
//  OAStackViewDemo
//
//  Created by Ray on 16/1/12.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "FirstTableViewController.h"
#import "DPFirstIndexCell.h"

@interface FirstTableViewController ()

@end

@implementation FirstTableViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.tableView registerClass:[DPFirstIndexCell class] forCellReuseIdentifier:@"DPFirstIndexCell"];

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"全部";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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
