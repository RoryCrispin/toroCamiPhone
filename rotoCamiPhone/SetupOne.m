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
@synthesize sensor;
@synthesize DevicePicker;  
AppDelegate *appDelegate;

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
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    peripheralViewControllerArray = [[NSMutableArray alloc] init];
    DevicePicker.delegate = self;
    DevicePicker.dataSource = self;
}
-(void)setConnect
{
    appDelegate.activPeri = sensor.activePeripheral;
    printf("Connected");
    NSData *data = [@"H" dataUsingEncoding:[NSString defaultCStringEncoding]];
    if(data.length > 20)
    {
        int i = 0;
        while ((i + 1) * 20 <= data.length) {
            NSData *dataSend = [data subdataWithRange:NSMakeRange(i * 20, 20)];
            [sensor write:sensor.activePeripheral data:dataSend];
            i++;
        }
        i = data.length % 20;
        if(i > 0)
        {
            NSData *dataSend = [data subdataWithRange:NSMakeRange(data.length - i, i)];
            [sensor write:sensor.activePeripheral data:dataSend];
        }
        
    }else
    {
        //NSData *data = [MsgToArduino.text dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:data];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) peripheralFound:(CBPeripheral *)peripheral
{
    //BLEDeviceViewController *controller = [[BLEDeviceViewController alloc] init];
    //controller.peripheral = peripheral;
    //controller.sensor = sensor;
    [peripheralViewControllerArray addObject:[peripheral name]];
    [DevicePicker reloadAllComponents];
    [sensor connect:peripheral];
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

- (void)dgStart {
    sensor.delegate = self;
    printf("now we are searching device...\n");
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
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)DevicePicker
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)DevicePicker numberOfRowsInComponent:(NSInteger)component
{
    return [peripheralViewControllerArray count];
}
//TODO Delete this
-(void)sendD:(NSString *)dat
{
    sensor = [[SerialGATT alloc] init];
    [sensor setup];
    
    printf("Connected");
    NSData *data = [dat dataUsingEncoding:[NSString defaultCStringEncoding]];
    if(data.length > 20)
    {
        int i = 0;
        while ((i + 1) * 20 <= data.length) {
            NSData *dataSend = [data subdataWithRange:NSMakeRange(i * 20, 20)];
            [sensor write:sensor.activePeripheral data:dataSend];
            i++;
        }
        i = data.length % 20;
        if(i > 0)
        {
            NSData *dataSend = [data subdataWithRange:NSMakeRange(data.length - i, i)];
            [sensor write:sensor.activePeripheral data:dataSend];
        }
        
    }else
    {
        //NSData *data = [MsgToArduino.text dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:data];
    }


}


@end


