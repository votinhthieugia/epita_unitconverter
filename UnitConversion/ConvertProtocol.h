//
//  ConvertProtocol.h
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/10/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ConvertProtocol <NSObject>

- (double)convert:(double)orignalValue fromUnit:(int)fromUnit toUnit:(int)toUnit;
- (NSArray*)definitions;

@end