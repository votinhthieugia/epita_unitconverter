//
//  AreaConverter.m
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/10/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import "AreaConverter.h"
#import "UnitInfo.h"

typedef enum : NSInteger { SquareKilometer, SquareMeter, SquareFoot } AreaUnit;

@implementation AreaConverter

@synthesize selfDefinitions = _selfDefinitions;

- (double)convert:(double)originalValue fromUnit:(int)fromUnit toUnit:(int)toUnit {
    if (fromUnit == toUnit) return originalValue;
    
    double result = originalValue;
    switch (fromUnit) {
        case SquareKilometer:
            switch (toUnit) {
                case SquareMeter: result *= 1000000; break;
                case SquareFoot: result *= 10.764 * 1000000; break;
            }
            break;
        case SquareMeter:
            switch (toUnit) {
                case SquareKilometer: result /= 1000000; break;
                case SquareFoot: result *= 10.764; break;
            }
            break;
        case SquareFoot:
            switch (toUnit) {
                case SquareMeter: result /= 10.764; break;
                case SquareKilometer: result /= 10.764 * 1000000; break;
            }
            break;
        default:
            break;
    }
    
    return result;
}

- (NSArray*)definitions {
    if (!_selfDefinitions) {
        _selfDefinitions = [[NSMutableArray alloc] init];
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:SquareKilometer titleString:@"Square Kilometer"]];
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:SquareMeter titleString:@"Square Meter"]];
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:SquareFoot titleString:@"Square Feet"]];
    }
    
    return _selfDefinitions;
}

@end
