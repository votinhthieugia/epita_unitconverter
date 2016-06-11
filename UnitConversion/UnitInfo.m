//
//  UnitInfo.m
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/10/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import "UnitInfo.h"

@implementation UnitInfo

- (id)initWithTypeAndTitle:(int)type titleString:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
        self.type = type;
        return self;
    }
    
    return nil;
}

@end
