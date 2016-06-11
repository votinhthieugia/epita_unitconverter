//
//  BaseConverter.h
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/11/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConvertProtocol.h"

@interface BaseConverter : NSObject <ConvertProtocol>

@property (nonatomic) NSString *title;

- (id)initWithTitle:(NSString *)title;

@end
