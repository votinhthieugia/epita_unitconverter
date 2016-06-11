//
//  ViewController.h
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/7/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConverterDelegate.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pvMeasureType;
@property (weak, nonatomic) IBOutlet UIPickerView *pvUnits;
@property (weak, nonatomic) IBOutlet UITextField *tfInput;
@property (weak, nonatomic) IBOutlet UIButton *btnConvert;
@property (weak, nonatomic) IBOutlet UILabel *lbResult;

@property (nonatomic) ConverterDelegate *converterDelegate;


@end

