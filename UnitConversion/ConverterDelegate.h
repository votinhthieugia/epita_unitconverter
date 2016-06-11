//
//  Converter.h
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/10/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger { Area, Length, Speed, Temperature } MeasureType;

@interface ConverterDelegate : NSObject

@property (nonatomic) NSMutableArray *converters;

- (double)convert:(MeasureType)measureType value:(double)originalValue fromUnit:(int)fromUnit toUnit:(int)toUnit;

@end
