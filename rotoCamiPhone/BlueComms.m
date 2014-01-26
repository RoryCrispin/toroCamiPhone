//
//  BlueComms.m
//  toroCamiPhone
//
//  Created by Rory Crispin on 25/01/2014.
//  Copyright (c) 2014 rotoCam. All rights reserved.
//

#import "BlueComms.h"
#import "SerialGATT.h"
#import "AppDelegate.h"

#import "simpleShootViewController.h"
#import "timelapseViewController.h"

SerialGATT *sensor;

@implementation BlueComms
AppDelegate *appDelegate;

simpleShootViewController *ssView1;
timelapseViewController *ssView2;

-(void) sendMessage:(NSString *)message
{
    
}

-(void) setUp
{
    sensor = [[SerialGATT alloc] init];
    sensor.delegate = self;
    [sensor setup];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    sensor.activePeripheral = appDelegate.activePeripheral;
    if (sensor.activePeripheral.state == CBPeripheralStateConnected)
    {
        printf("Connected");
    }
    else
    {
        printf("Not connected");
    }
}

//-(void) didRecieveMessage:(NSString *) recvMessage
-(void) didRecieveMessage
{
    /*switch (_openView)
    {
        case 1:
            if (ssView1 == nil)
            {
             ssView1 = [[simpleShootViewController alloc] init];
            }
            else
            {
               [ssView1 didReceiveMessage:recvMessage];
            }
            break;
        case 2:
            if (ssView2 == nil)
            {
                ssView2 = [[timelapseViewController alloc] init];
            }
            else
            {
                [ssView2 didReceiveMessage:recvMessage];
            }
            break;
    }
     */
}

//Delegate Methods
- (void) setConnect {
    NSLog(@"Connected");
}
- (void) setDisconnect {
    NSLog(@"Disconnected");
}
-(void) write:(NSString *)dataToWrite
{
    NSLog(@"Send Data: %@",dataToWrite);
    NSData *data = [dataToWrite dataUsingEncoding:[NSString defaultCStringEncoding]];
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

