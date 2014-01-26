//
//  timelapseViewController.m
//  toroCamiPhone
//
//  Created by Rozzles on 31/10/2013.
//  Copyright (c) 2013 rotoCam. All rights reserved.
//

#import "timelapseViewController.h"
#import "BlueComms.h"

@implementation timelapseViewController
@synthesize hoursArray;
@synthesize minsArray;
@synthesize secsArray;
@synthesize UTLtimeDelayPicker;
NSArray *UTLtimeDelayArray;
BlueComms *bluecomms;


-(void)viewDidLoad

{
    [super viewDidLoad];
    UTLtimeDelayPicker.delegate = self;
    UTLtimeDelayPicker.dataSource = self;
    
    UTLtimeDelayArray = [NSArray arrayWithObjects: 0, 0, 0, nil];
    
    bluecomms = [[BlueComms alloc] init];
    [bluecomms setUp];
    
    //Load the arrays with 1-60 values for sec/min/hrs
    hoursArray = [[NSMutableArray alloc] init];
    minsArray = [[NSMutableArray alloc] init];
    secsArray = [[NSMutableArray alloc] init];
    NSString *strVal = [[NSString alloc] init];
    [hoursArray addObject:@"Hours"];
    [minsArray addObject:@"Min"];
    [secsArray addObject:@"Sec"];
    for(int i=1; i<61; i++)
    {
        strVal = [NSString stringWithFormat:@"%d", i];
        
        [hoursArray addObject:strVal];
        [minsArray addObject:strVal];
        [secsArray addObject:strVal];
    }
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)UTLtimeDelayPicker
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)UTLtimeDelayPicker numberOfRowsInComponent :(NSInteger)component
{
    if (component==0)
    {
        return [hoursArray count];
    }
    else if (component==1)
    {
        return [minsArray count];
    }
    else
    {
        return [secsArray count];
    }
    
}

- (NSString *)pickerView:(UIPickerView *)UTLtimeDelayPicker titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    switch (component)
    {
        case 0:
            return [hoursArray objectAtIndex:row];
            break;
        case 1:
            return [minsArray objectAtIndex:row];
            break;
        case 2:
            return [secsArray objectAtIndex:row];
            break;
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)UTLtimeDelayPicker didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

- (IBAction)delaySliderChange:(id)sender {
    
}
- (IBAction)UTLtimeDelaySliderChanged:(id)sender {
}
- (IBAction)UTLbackButton:(id)sender {
}
- (IBAction)UTLtoggleButtonAction:(id)sender {
    [bluecomms write:[NSString stringWithFormat:@"2,%i,%i,%i,0!", [UTLtimeDelayPicker selectedRowInComponent:2],[UTLtimeDelayPicker selectedRowInComponent:1],[UTLtimeDelayPicker selectedRowInComponent:0]]];
    
    
}
@end