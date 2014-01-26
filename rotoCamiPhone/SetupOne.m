//
//  SetupOne.m
//  toroCamiPhone
//
//  Created by Rozzles on 21/09/2013.
//  Copyright (c) 2013 rotoCam. All rights reserved.
//

#import "SetupOne.h"
#import "SerialGATT.h"
#import "AppDelegate.h"

@interface SetupOne ()

@end

@implementation SetupOne
@synthesize peripheralViewControllerArray;
@synthesize peripheralArray;
@synthesize sensor;
@synthesize DevicePicker;  

short pickerPosition;
AppDelegate *appDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    pickerPosition = 0;
    sensor = [[SerialGATT alloc] init];
    sensor.delegate = self;
    [sensor setup];
    
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    peripheralViewControllerArray = [[NSMutableArray alloc] init];
    peripheralArray = [[NSMutableArray alloc] init];
    DevicePicker.delegate = self;
    DevicePicker.dataSource = self;
    
    // I had some issues with the autoscan runnign before the bluetooth is set up so this GDC fucntion
    // sleeps the seperate thread for 0.2s then scans for peripherals
    dispatch_queue_t myQueue;
    if (!myQueue)
        {
            myQueue = dispatch_queue_create("com.rozzles.torocam", NULL);
        }
    dispatch_async(myQueue, ^{ [NSThread sleepForTimeInterval:0.2]; [sensor findHMSoftPeripherals:5];});
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void) peripheralFound:(CBPeripheral *)peripheral
{
    [_SetupOneScanConnectButton setTitle:@"Connect" forState:UIControlStateNormal];
    [peripheralViewControllerArray addObject:[peripheral name]];
    [peripheralArray addObject:peripheral];
    [DevicePicker reloadAllComponents];
}

- (IBAction)actionSetupOneScan:(id)sender {
    if( [peripheralArray count]==0)
    {
    printf("now we are searching device...\n");
    
    [sensor findHMSoftPeripherals:5];
    } else {
        appDelegate.activePeripheral = [peripheralArray objectAtIndex:pickerPosition];
        [sensor connect:appDelegate.activePeripheral];
    }
}
-(void) setConnect
{
   UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"FlatHome"];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void) scanTimer:(NSTimer *)timer
{

    printf("Scan timeout");
}


//PickerView
- (NSString *)pickerView:(UIPickerView *)DevicePicker titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [peripheralViewControllerArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)DevicePicker didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    pickerPosition = row;
    NSLog(@" Row: %i %@", row, [[peripheralArray objectAtIndex:row] name]);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)DevicePicker
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)DevicePicker numberOfRowsInComponent:(NSInteger)component
{
    return [peripheralViewControllerArray count];
}


@end


