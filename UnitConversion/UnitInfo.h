//
//  UnitInfo.h
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/10/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UnitInfo : NSObject

@property (nonatomic) int type;
@property (nonatomic) NSString *title;

- (id)initWithTypeAndTitle:(int)type titleString:(NSString *)title;

@end
