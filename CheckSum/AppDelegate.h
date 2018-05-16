//
//  AppDelegate.h
//  CheckSum
//
//  Created by Alonso on 2018/3/9.
//  Copyright © 2018年 Alonso. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSWindowDelegate>
@property (weak) IBOutlet NSTextField *FilePath;
- (IBAction)Check:(id)sender;

@property NSString *ReturnStr;

@end

