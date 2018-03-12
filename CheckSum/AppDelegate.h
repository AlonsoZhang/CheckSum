//
//  AppDelegate.h
//  CheckSum
//
//  Created by SSD on 2018/3/9.
//  Copyright © 2018年 baker. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSWindowDelegate>
@property (weak) IBOutlet NSTextField *FilePath;
- (IBAction)Check:(id)sender;

@property NSString *ReturnStr;

@end

