//
//  DPScrollTableView.h
//  OAStackViewDemo
//
//  Created by Ray on 15/12/25.
//  Copyright © 2015年 Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DPItemsScrollViewItemBlock)(NSInteger index);

@interface DPScrollTableView : UIView

/**
 *  按钮所在区域
 */
@property (nonatomic, strong) UIView *topBtnBackView;

/**
 *  当前点击btn
 */
@property (nonatomic, strong) UIButton *currentBtn;
/**
 *  上次点击btn
 */
@property (nonatomic, strong) UIButton *lastBtn;
/**
 *  指示器
 */
@property (nonatomic, strong) UIView *indicatorView;
/**
 *  btnView的高度
 */
@property (nonatomic, weak) MASConstraint *btnViewHeight;

/**
 *  表格所在区域
 */
@property (nonatomic, strong) UIScrollView *tabContentView;
/**
 *  所有view容器
 */
@property (nonatomic, strong) NSMutableArray *tableViewsArray;
/**
 *  item点击
 */
@property (nonatomic, copy) DPItemsScrollViewItemBlock itemTappedBlock;

@property (nonatomic, strong)NSArray* tabsArray ;
/**
 *  设置当前选中位置
 */
@property(nonatomic, assign)NSInteger currentIndex ;
 /**
 *  初始化
 *
 *  @param frame
 *  @param items 按钮titles
 *
 *  @return
 */
//- (instancetype)initWithFrame:(CGRect)frame andItems:(NSArray *)items;
- (instancetype)initWithItems:(NSArray*)items ;


@end
