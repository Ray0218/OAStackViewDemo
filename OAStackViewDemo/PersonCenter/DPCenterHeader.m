//
//  DPCenterHeader.m
//  OAStackViewDemo
//
//  Created by Ray on 16/1/12.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "DPCenterHeader.h"

@implementation DPCenterHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bounces = NO ;
    }
    return self;
}

@end
