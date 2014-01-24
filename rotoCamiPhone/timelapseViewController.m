//
//  timelapseViewController.m
//  toroCamiPhone
//
//  Created by Rozzles on 31/10/2013.
//  Copyright (c) 2013 rotoCam. All rights reserved.
//

#import "timelapseViewController.h"


@implementation timelapseViewController
@synthesize hoursArray;
@synthesize minsArray;
@synthesize secsArray;
NSArray *UTLtimeDelayArray;

-(void)viewDidLoad

{
    [super viewDidLoad];
    _UTLtimeDelayPicker.delegate = self;
    _UTLtimeDelayPicker.dataSource = self;
    
    UTLtimeDelayArray = [NSArray arrayWithObjects: 0, 0, 0, nil];
    
    //Load the arrays with 1-60 values for sec/min/hrs
    hoursArray = [[NSMutableArray alloc] init];
    minsArray = [[NSMutableArray alloc] init];
    secsArray = [[NSMutableArray alloc] init];
    NSString *strVal = [[NSString alloc] init];
    [hoursArray addObject:@"Hours"];
    [minsArray addObject:@"Minutes"];
    [secsArray addObject:@"Seconds"];
    for(int i=1; i<61; i++)
    {
        strVal = [NSString stringWithFormat:@"%d", i];
        
        //NSLog(@"strVal: %@", strVal);
        
        //Create array with 0-12 hours
        if (i < 13)
        {
            [hoursArray addObject:strVal];
        }
        
        //create arrays with 0-60 secs/mins
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
   // UTLtimeDelayArray[component] = row;
    //[UTLtimeDelayArray setValue:<#(id)#> forKey:<#(NSString *)#>]
}

- (IBAction)delaySliderChange:(id)sender {
    
}
- (IBAction)UTLtimeDelaySliderChanged:(id)sender {
}
- (IBAction)UTLbackButton:(id)sender {
}
@end