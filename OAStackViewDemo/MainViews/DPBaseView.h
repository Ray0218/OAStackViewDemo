//
//  DPBaseView.h
//  OAStackViewDemo
//
//  Created by Ray on 15/12/28.
//  Copyright © 2015年 Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPFirstIndexCell.h"

@interface DPBaseView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong, readonly) UITableView *tableView;

@property (nonatomic, strong) NSString *cellIdentify;

@property (nonatomic, assign) CGFloat offsetOfTable;


@end




typedef void(^DPTabBarSelect)(NSInteger index);
@interface DPTabBarView : UIView

@property (nonatomic ,copy) DPTabBarSelect barselectd ;

/**
 *  设置当前选中位置
 */
@property(nonatomic, assign)NSInteger currentIndex ;

- (instancetype)initWithTitles:(NSArray*)titles ;


@end