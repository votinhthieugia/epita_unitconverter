//
//  ViewController.m
//  UnitConversion
//
//  Created by Hoang Anh Doan on 6/7/16.
//  Copyright © 2016 Hoang Anh Doan. All rights reserved.
//

#import "ViewController.h"
#import "BaseConverter.h"
#import "UnitInfo.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize converterDelegate = _converterDelegate;
@synthesize pvMeasureType = _pvMeasureType;
@synthesize pvUnits = _pvUnits;
@synthesize tfInput = _tfInput;
@synthesize lbResult = _lbResult;

int currentMeasureType;
int fromUnit;
int toUnit;

- (ConverterDelegate*)converter {
    if (!_converterDelegate) {
        _converterDelegate = [[ConverterDelegate alloc] init];
    }
    
    return _converterDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pvMeasureType.delegate = self;
    self.pvMeasureType.dataSource = self;
    
    self.pvUnits.delegate = self;
    self.pvUnits.dataSource = self;
    
    self.tfInput.delegate = self;
    currentMeasureType = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    if (thePickerView == self.pvMeasureType) return [self.converter.converters count];
    BaseConverter *baseConverter = [self.converter.converters objectAtIndex:currentMeasureType];
    return [[baseConverter definitions] count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (thePickerView == self.pvMeasureType) {
        BaseConverter *baseConverter = [self.converter.converters objectAtIndex:row];
        return baseConverter.title;
    }
    
    BaseConverter *baseConverter = [self.converter.converters objectAtIndex:currentMeasureType];
    UnitInfo *unitInfo = [[baseConverter definitions] objectAtIndex:row];
    return unitInfo.title;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return (thePickerView == self.pvMeasureType) ? 1 : 2;
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (thePickerView == self.pvMeasureType) {
        currentMeasureType = (int)row;
        [self.pvUnits reloadAllComponents];
    } else {
        if (component == 0) fromUnit = (int)row;
        else toUnit = (int)row;
    }
}

- (IBAction)btnConvert:(UIButton *)sender {
    double input = [self.tfInput.text doubleValue];
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    if ([nf numberFromString:self.tfInput.text] != nil || input < 0) {
        double output = [self.converter convert:currentMeasureType value:input fromUnit:fromUnit toUnit:toUnit];
        self.lbResult.text = [NSString stringWithFormat:@"%f", output];
        self.lbResult.textColor = [UIColor blackColor];
    } else {
        self.lbResult.textColor = [UIColor redColor];
        self.lbResult.text = @"Wrong input";
    }
}

@end