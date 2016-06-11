//
//  TemperatureConverter.m
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/10/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import "TemperatureConverter.h"
#import "UnitInfo.h"

typedef enum : NSInteger { Celcius, Fahrenheit, Kelvin } TemperatureUnit;

@implementation TemperatureConverter

@synthesize selfDefinitions = _selfDefinitions;

- (double)convert:(double)originalValue fromUnit:(int)fromUnit toUnit:(int)toUnit {
    if (fromUnit == toUnit) return originalValue;
    
    double result = originalValue;
    switch (fromUnit) {
        case Celcius:
            switch (toUnit) {
                case Fahrenheit: result = originalValue * 9/5 + 32; break;
                case Kelvin: result = originalValue + 273.15; break;
            }
            break;
        case Fahrenheit:
            switch (toUnit) {
                case Celcius: result = (originalValue - 32) * 5/9; break;
                case Kelvin: result = (originalValue + 459.67) * 5/9; break;
            }
            break;
        case Kelvin:
            switch (toUnit) {
                case Fahrenheit: result = originalValue * 9/5 - 459.67; break;
                case Celcius: result = originalValue - 273.15; break;
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
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:Celcius titleString:@"Celcius"]];
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:Fahrenheit titleString:@"Fahrenheit"]];
        [_selfDefinitions addObject:[[UnitInfo alloc] initWithTypeAndTitle:Kelvin titleString:@"Kelvin"]];
    }
    
    return _selfDefinitions;
}

@end
