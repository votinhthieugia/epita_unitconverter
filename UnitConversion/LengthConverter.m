//
//  LengthConverter.m
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/10/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import "LengthConverter.h"
#import "UnitInfo.h"

typedef enum : NSInteger { Kilometer, Meter, Mile, Foot } LengthUnit;

@implementation LengthConverter

@synthesize selfDefinitions = _selfDefinitions;

- (double)convert:(double)originalValue fromUnit:(int)fromUnit toUnit:(int)toUnit {
    if (fromUnit == toUnit) return originalValue;
    
    double result = originalValue;
    switch (fromUnit) {
        case Kilometer:
            switch (toUnit) {
                case Meter: result *= 1000; break;
                case Mile: result *= 0.621371192; break;
                case Foot: result *= 3280.8399; break;
            }
            break;
        case Meter:
            switch (toUnit) {
                case Kilometer: result /= 1000; break;
                case Mile: result *= 0.000621371192; break;
                case Foot: result *= 3.2808399; break;
            }
            break;
        case Mile:
            switch (toUnit) {
                case Meter: result *= 1609.344; break;
                case Kilometer: result *= 1.609344; break;
                case Foot: result *= 5280; break;
            }
            break;
        case Foot:
            switch (toUnit) {
                case Meter: result *= 0.3048; break;
                case Mile: result *= 0.000189393939; break;
                case Kilometer: result *= 0.0003048; break;
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
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:Kilometer titleString:@"Kilometer"]];
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:Meter titleString:@"Meter"]];
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:Mile titleString:@"Mile"]];
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:Foot titleString:@"Foot"]];
    }
    
    return _selfDefinitions;
}

@end
