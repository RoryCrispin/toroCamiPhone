//
//  simpleShootViewController.m
//  toroCamiPhone
//
//  Created by Rozzles on 20/09/2013.
//  Copyright (c) 2013 rotoCam. All rights reserved.
//

#import "simpleShootViewController.h"

@interface simpleShootViewController ()

@end

@implementation simpleShootViewController

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [timeArray count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [timeArray objectAtIndex:row];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    timeArray = [[NSMutableArray alloc] init];
    [timeArray addObject:@"0 Seconds"];
    [timeArray addObject:@"0 Minutes"];
    [timeArray addObject:@"0 Hours"];
    [BulbModePickerSet selectRow:2 inComponent:0 animated:0];
     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TimeDelaySliderChange:(id)sender forEvent:(UIEvent *)event {
    _TimeDelayValue.text = [NSString stringWithFormat:@"%.0f Seconds", _TimeDelaySlider.value];
}

- (IBAction)BulbModeSliderChange:(id)sender {
    bulbModeSliderValue = _BulbModeSlider.value;
    [timeArray replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%.0f Seconds", bulbModeSliderValue]];
     [timeArray replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%.0f Minutes", bulbModeSliderValue]];
     [timeArray replaceObjectAtIndex:2 withObject:[NSString stringWithFormat:@"%.0f Hours", bulbModeSliderValue]];
    [_BulbModePickerObj reloadAllComponents];
}
- (IBAction)BulbModeSwitchChange:(id)sender {
    bulbModeBool = _BulbModeSwitch.on;
    [_BulbModeSlider setEnabled:bulbModeBool];
    if (bulbModeBool){
        [_BulbModePickerObj setUserInteractionEnabled:YES];
        [_BulbModePickerObj setAlpha:1];
    } else {
        [_BulbModePickerObj setUserInteractionEnabled:NO];
        [_BulbModePickerObj setAlpha:.6];
    }
}
-(NSString *)bulbModeDelayParse{
    if (bulbModeBool){
        NSLog(@"hello?? %d", [_BulbModePickerObj selectedRowInComponent:0]);
        switch ([_BulbModePickerObj selectedRowInComponent:0]) {
                //TODO This is VERY inaccurate because I'm multiplying by the floats before rounding them
                //Floats are prety unpredictable. 
            case 0: {
                return [NSString stringWithFormat:@"%.0f",_BulbModeSlider.value];
                break;
            }
            case 1:{
                return [NSString stringWithFormat:@"%.0f",_BulbModeSlider.value*60];
                break;
            }
            case 2:{
                return [NSString stringWithFormat:@"%.0f",_BulbModeSlider.value*3600];
                break;
            }
            default:{
                return @"0";
                break;
            }
        }
    } else {
        return @"0";
    }
}

- (IBAction)captureButtonAction:(id)sender {
   // [blueCommsiPhone sendMsg:[NSString stringWithFormat:@"1,%.0f,%@,0,0,0,0,0,0!", _TimeDelaySlider.value, [self bulbModeDelayParse]]];
}
@end
