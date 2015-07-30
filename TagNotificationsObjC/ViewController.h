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

#import <UIKit/UIKit.h>
#import <IBMMobileFirstPlatformFoundation/IBMMobileFirstPlatformFoundation.h>


@interface ViewController : UIViewController{
    @public
    UITextView* console;
}

@property (weak, nonatomic) IBOutlet UIButton *subscribeTag1;
@property (weak, nonatomic) IBOutlet UIButton *subscribeTag2;
@property (weak, nonatomic) IBOutlet UIButton *unsubscribeTag1;
@property (weak, nonatomic) IBOutlet UIButton *unsubscribeTag2;

@property (weak, nonatomic) IBOutlet UITextView *console;
@property (nonatomic, strong)NSString *alias;
@property (nonatomic, strong)NSString *adapterName;
@property (nonatomic, strong)NSString *eventSourceName;
@property (nonatomic, strong)NSString *securityRealm;
@property (nonatomic, strong)NSString *username;
@property (nonatomic, strong)NSString *password;

- (void)updateMessage:(NSString *)data;
- (void)enablePushOptions;
@end
