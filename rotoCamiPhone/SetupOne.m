//
//  SetupOne.m
//  toroCamiPhone
//
//  Created by Rozzles on 21/09/2013.
//  Copyright (c) 2013 rotoCam. All rights reserved.
//

#import "SetupOne.h"
#import "SerialGATT.h"
@interface SetupOne ()

@end

@implementation SetupOne
@synthesize peripheralViewControllerArray;
@synthesize sensor;
@synthesize DevicePicker;  

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
	// Do any additional setup after loading the view.
    sensor = [[SerialGATT alloc] init];
    [sensor setup];
    
    peripheralViewControllerArray = [[NSMutableArray alloc] init];
    [peripheralViewControllerArray addObject:@"Hello"];
    
    DevicePicker.delegate = self;
    DevicePicker.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) peripheralFound:(CBPeripheral *)peripheral
{
    printf("PERIPHERALDELEGATE");
    //BLEDeviceViewController *controller = [[BLEDeviceViewController alloc] init];
    //controller.peripheral = peripheral;
    //controller.sensor = sensor;
    [peripheralViewControllerArray addObject:[peripheral name]];
    [DevicePicker reloadAllComponents];
    
}

- (IBAction)actionSetupOneScan:(id)sender {
   /*
    if ([sensor activePeripheral]) {
        if (sensor.activePeripheral.state == CBPeripheralStateConnected) {
            [sensor.manager cancelPeripheralConnection:sensor.activePeripheral];
            sensor.activePeripheral = nil;
        }
    }
    
    if ([sensor peripherals]) {
        sensor.peripherals = nil;
        [peripheralViewControllerArray removeAllObjects];
    }
    */
    
    sensor.delegate = self;
    
    printf("now we are searching device...\n");
    //[Scan setTitle:@"Scaning" forState:UIControlStateNormal];
    //[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(scanTimer:) userInfo:nil repeats:NO];
    
    [sensor findHMSoftPeripherals:5];
}

-(void) scanTimer:(NSTimer *)timer
{
    //[Scan setTitle:@"Scan"];
    printf("finished scan");
}


//PickerView
- (NSString *)pickerView:(UIPickerView *)DevicePicker titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [peripheralViewControllerArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)DevicePicker didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    printf("Selected obj");
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


