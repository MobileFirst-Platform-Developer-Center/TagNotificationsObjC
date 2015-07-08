/*
 *
 COPYRIGHT LICENSE: This information contains sample code provided in source code form. You may copy, modify, and distribute
 these sample programs in any form without payment to IBM® for the purposes of developing, using, marketing or distributing
 application programs conforming to the application programming interface for the operating platform for which the sample code is written.
 Notwithstanding anything to the contrary, IBM PROVIDES THE SAMPLE SOURCE CODE ON AN "AS IS" BASIS AND IBM DISCLAIMS ALL WARRANTIES,
 EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, ANY IMPLIED WARRANTIES OR CONDITIONS OF MERCHANTABILITY, SATISFACTORY QUALITY,
 FITNESS FOR A PARTICULAR PURPOSE, TITLE, AND ANY WARRANTY OR CONDITION OF NON-INFRINGEMENT. IBM SHALL NOT BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR OPERATION OF THE SAMPLE SOURCE CODE.
 IBM HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS OR MODIFICATIONS TO THE SAMPLE SOURCE CODE.
 
 */

#import "ViewController.h"
#import "AppDelegate.h"
#import "MyConnectListener.h"
#import "ReadyToSubscribeListener.h"
#import "MySubscribeListener.h"
#import "MyUnsubscribeListener.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize console=_console;
@synthesize subscribeTag1=_subscribeTag1;
@synthesize subscribeTag2=_subscribeTag2;
@synthesize unsubscribeTag1=_unsubscribeTag1;
@synthesize unsubscribeTag2=_unsubscribeTag2;


- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
	appDelegate.appDelegateVC = self;
	[[WLPush sharedInstance]init];
    self.subscribeTag1.enabled=false;
    self.subscribeTag2.enabled=false;
    self.unsubscribeTag1.enabled=false;
    self.unsubscribeTag2.enabled=false;
    
    MyConnectionListener *connectListener = [[MyConnectionListener alloc] initWithController:self];
    
    ReadyToSubscribeListener *readyToSubscribeListener = [[ReadyToSubscribeListener alloc] initWithController:self];
    
    [[WLPush sharedInstance] setOnReadyToSubscribeListener:readyToSubscribeListener];
    
    [[WLClient sharedInstance] wlConnectWithDelegate:connectListener];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)isPushSupported:(id)sender {
    
    NSString *isPushSupported = [[WLPush sharedInstance] isPushSupported]? @"true":@"false";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"isPushSupported"
                                                    message:isPushSupported
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}
- (IBAction)isSubscribed:(id)sender {
    
    NSString *tag1=[[WLPush sharedInstance]isTagSubscribed:@"sample-tag1"] ? @"true" : @"false";
    NSString *tag2=[[WLPush sharedInstance]isTagSubscribed:@"sample-tag2"] ? @"true" : @"false";

    NSString *str=[NSString stringWithFormat:@"sample-tag1 :: %@ \nsample-tag2 :: %@",tag1,tag2] ;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"isSubscribed"
                                                    message:str
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
   }

- (IBAction)subscribetag1:(id)sender {
    
    MySubscribeListener *mySubscribeListener = [[MySubscribeListener alloc] initWithController:self];
    [[WLPush sharedInstance]subscribeTag:@"sample-tag1" :nil :mySubscribeListener];
    
}
- (IBAction)subscribetag2:(id)sender {
   
    MySubscribeListener *mySubscribeListener = [[MySubscribeListener alloc] initWithController:self];
    [[WLPush sharedInstance]subscribeTag:@"sample-tag2" :nil :mySubscribeListener];
}


- (IBAction)unsubscribetag1:(id)sender {
    MyUnsubscribeListener *myUnsubscribelistener = [[MyUnsubscribeListener alloc]initWithController:self];
    [[WLPush sharedInstance]unsubscribeTag:@"sample-tag1" :myUnsubscribelistener];
    
}

- (IBAction)unsubscribetag2:(id)sender {
    MyUnsubscribeListener *myUnsubscribelistener = [[MyUnsubscribeListener alloc]initWithController:self];
    [[WLPush sharedInstance]unsubscribeTag:@"sample-tag2" :myUnsubscribelistener];
}


- (void)updateMessage:(NSString *)data{
	self.console.text = [NSString stringWithFormat:@"%@ \n%@", self.console.text, data];
}

- (void)enablePushOptions{
    self.subscribeTag1.enabled=true;
    self.subscribeTag2.enabled=true;
    self.unsubscribeTag1.enabled=true;
    self.unsubscribeTag2.enabled=true;
}


@end
