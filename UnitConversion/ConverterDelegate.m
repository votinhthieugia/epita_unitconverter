//
//  Converter.m
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/10/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import "ConverterDelegate.h"
#import "AreaConverter.h"
#import "LengthConverter.h"
#import "SpeedConverter.h"
#import "TemperatureConverter.h"

@implementation ConverterDelegate

@synthesize converters = _converters;

- (NSMutableArray *)converters {
    if (!_converters) {
        _converters = [[NSMutableArray alloc] init];
        [_converters addObject: [[AreaConverter alloc] initWithTitle:@"Area"]];
        [_converters addObject: [[LengthConverter alloc] initWithTitle:@"Length"]];
        [_converters addObject: [[SpeedConverter alloc] initWithTitle:@"Speed"]];
        [_converters addObject: [[TemperatureConverter alloc] initWithTitle:@"Temperature"]];
    }
    
    return _converters;
}

- (double)convert:(MeasureType)measureType value:(double)originalValue fromUnit:(int)fromUnit toUnit:(int)toUnit {
    if (measureType >= self.converters.count) {
        return 0;
    }
    
    return [[self.converters objectAtIndex:measureType] convert:originalValue fromUnit:fromUnit toUnit:toUnit];
}

@end
