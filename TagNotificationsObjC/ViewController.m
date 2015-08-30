/**
* Copyright 2015 IBM Corp.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
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

@synthesize subscribeTag1=_subscribeTag1;
@synthesize subscribeTag2=_subscribeTag2;
@synthesize unsubscribeTag1=_unsubscribeTag1;
@synthesize unsubscribeTag2=_unsubscribeTag2;


- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
	appDelegate.appDelegateVC = self;
    self.subscribeTag1.enabled=false;
    self.subscribeTag2.enabled=false;
    self.unsubscribeTag1.enabled=false;
    self.unsubscribeTag2.enabled=false;
    
    MyConnectionListener *connectListener = [[MyConnectionListener alloc] init];
    
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
    
    MySubscribeListener *mySubscribeListener = [[MySubscribeListener alloc] init];
    [[WLPush sharedInstance]subscribeTag:@"sample-tag1" :nil :mySubscribeListener];
    
}
- (IBAction)subscribetag2:(id)sender {
   
    MySubscribeListener *mySubscribeListener = [[MySubscribeListener alloc] init];
    [[WLPush sharedInstance]subscribeTag:@"sample-tag2" :nil :mySubscribeListener];
}


- (IBAction)unsubscribetag1:(id)sender {
    MyUnsubscribeListener *myUnsubscribelistener = [[MyUnsubscribeListener alloc]init];
    [[WLPush sharedInstance]unsubscribeTag:@"sample-tag1" :myUnsubscribelistener];
    
}

- (IBAction)unsubscribetag2:(id)sender {
    MyUnsubscribeListener *myUnsubscribelistener = [[MyUnsubscribeListener alloc]init];
    [[WLPush sharedInstance]unsubscribeTag:@"sample-tag2" :myUnsubscribelistener];
}


- (void)enablePushOptions{
    self.subscribeTag1.enabled=true;
    self.subscribeTag2.enabled=true;
    self.unsubscribeTag1.enabled=true;
    self.unsubscribeTag2.enabled=true;
}


@end
