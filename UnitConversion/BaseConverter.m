//
//  BaseConverter.m
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/11/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import "BaseConverter.h"


@implementation BaseConverter

@synthesize title = _title;

- (id)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
    }
    return self;
}

- (double)convert:(double)originalValue fromUnit:(int)fromUnit toUnit:(int)toUnit {
    return 0;
}

- (NSArray*)definitions {
    return nil;
}

@end
