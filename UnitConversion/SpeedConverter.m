//
//  SpeedConverter.m
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/10/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import "SpeedConverter.h"
#import "UnitInfo.h"

typedef enum : NSInteger { KilometerPH, MilePH, MeterPS } SpeedUnit;

@implementation SpeedConverter

@synthesize selfDefinitions = _selfDefinitions;

- (double)convert:(double)originalValue fromUnit:(int)fromUnit toUnit:(int)toUnit {
    if (fromUnit == toUnit) return originalValue;
    
    double result = originalValue;
    switch (fromUnit) {
        case KilometerPH:
            switch (toUnit) {
                case MeterPS: result *= 0.277777778; break;
                case MilePH: result *= 0.621371192; break;
            }
            break;
        case MeterPS:
            switch (toUnit) {
                case MilePH: result *= 2.23693629; break;
                case KilometerPH: result *= 3.6; break;
            }
            break;
        case MilePH:
            switch (toUnit) {
                case MeterPS: result *= 0.44704; break;
                case KilometerPH: result *= 1.609344; break;
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
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:KilometerPH titleString:@"Kilometer Per Hour"]];
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:MeterPS titleString:@"Meter Per Second"]];
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:MilePH titleString:@"Mile Per Hour"]];
    }
    
    return _selfDefinitions;
}

@end
