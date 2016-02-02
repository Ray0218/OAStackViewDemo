//
//  DPBaseView.m
//  OAStackViewDemo
//
//  Created by Ray on 15/12/28.
//  Copyright © 2015年 Ray. All rights reserved.
//

#import "DPBaseView.h"


@interface DPBaseView ()

@end
@implementation DPBaseView

@synthesize tableView = _tableView;

 
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsZero) ;
        }];
    }
    return self;
}

#pragma mark - Property (getter, setter)

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = (id<UITableViewDelegate>)self;
        _tableView.dataSource = (id<UITableViewDataSource>)self;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorColor = [UIColor grayColor] ;
        //        _tableView.allowsSelection = NO;
        //        _tableView.contentInset = UIEdgeInsetsMake(kHeaderHeight + kTabBarHeight, 0, 0, 0);
        //        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kHeaderHeight + kTabBarHeight)];
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
    
    
  }

 

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

//    NSLog(@"scrollView contentOffset ===  ") ;
    
//    [self setValue:@(scrollView.contentOffset.y) forKey:@"offsetOfTable"];
}

-(void)dealloc
{

 //    [self removeObserver:self forKeyPath:@"offsetOfTable"];
}

@end




@interface DPTabBarView ()
{

    NSMutableArray *_btnArray  ;
    
    UIView *_bottomView ;
}
/**
 *  上次点击btn
 */
@property (nonatomic, strong) UIButton *lastBtn;

 @end
@implementation DPTabBarView

- (instancetype)initWithTitles:(NSArray*)titles
{
    self = [super init];
    if (self) {
        _btnArray = [[NSMutableArray alloc]initWithCapacity:titles.count];
        for (int i= 0 ; i<titles.count; i++) {
            UIButton *btn = [self createBtnWithTitle:titles[i] tag:i+100] ;
            [self addSubview:btn];
            [_btnArray addObject:btn];
            
            
            _bottomView = [[UIView alloc]init];
            _bottomView.backgroundColor = [UIColor redColor] ;
            [self addSubview:_bottomView];
        }
    }
    return self;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    
    CGFloat width = CGRectGetWidth(self.frame)/_btnArray.count ;
    CGFloat heigh = CGRectGetHeight(self.frame) - 2 ;
    
    UIView *lastView ;
    for (int i= 0 ; i< _btnArray.count; i++) {
        UIButton *btn = _btnArray[i] ;
        
        if (i == 0) {
            btn.frame = CGRectMake(0, 0, width*0.8, heigh) ;
        }else if (i== 1){
            btn.frame = CGRectMake(CGRectGetMaxX(lastView.frame), 0, width*1.2, heigh) ;
        }else{
            btn.frame = CGRectMake(CGRectGetMaxX(lastView.frame), 0, width, heigh) ;
         }
        
        
        lastView = btn ;
    }
    
    UIButton *btn = _btnArray[self.currentIndex] ;
    _bottomView.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetHeight(self.frame)- 2, CGRectGetWidth(btn.frame), 2) ;

    
}

-(void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex ;
    
    UIButton *btn= (UIButton *)[ _btnArray objectAtIndex: currentIndex];

    if (self.barselectd) {
        self.barselectd(currentIndex) ;
        
     }
    
    if (btn.selected == NO) {
         btn.selected = !btn.selected;
        self.lastBtn.selected = NO;
        self.lastBtn = btn;
    }

    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
//    CGRect frame = btn.frame ;
//    _bottomView.frame = CGRectMake(CGRectGetMinX(frame), CGRectGetHeight(self.frame)- 2, CGRectGetWidth(frame), 2) ;

}


-(UIButton*)createBtnWithTitle:(NSString*)title tag:(NSInteger)tag {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom] ;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.tag = tag ;
     [btn addTarget:self action:@selector(pvt_clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    return  btn ;

}

-(void)pvt_clickBtn:(UIButton*)btn {

          self.currentIndex = btn.tag - 100 ;
 
}

//- (UIImage *)dp_imageWithColor:(UIColor *)color {
//    CGRect rect = CGRectMake(0, 0, 1, 1);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//    
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return image;
//}


@end










