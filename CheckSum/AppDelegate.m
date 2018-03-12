//
//  AppDelegate.m
//  CheckSum
//
//  Created by SSD on 2018/3/9.
//  Copyright © 2018年 baker. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    self.ReturnStr = @"";
    self.window.delegate = self;
}
-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

-(NSString *)FindinString:(NSString *)TargetString withregex:(NSString *) regexString
{
    NSError *error;
    NSString *pattern = [NSString stringWithFormat:@"%@",regexString];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    
    NSString *Result=@"";
    if (regex != nil)
    {
        NSTextCheckingResult *result = [regex firstMatchInString:TargetString options:0 range:NSMakeRange(0, [TargetString length])];
        
        if (result)
        {
            Result = [[TargetString substringWithRange:result.range]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
    }
    
    return Result;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (IBAction)Check:(id)sender {
    
//    NSLog( self.FilePath.stringValue );
    
    NSString *CMD = [NSString stringWithFormat:@"md5 %@/Contents/Resources/TestSpec_IT-4.plist",self.FilePath.stringValue];
    
    NSString *STR = [self RunCMD:CMD];
    
    NSString *OUTSTR = [NSString stringWithFormat:@"%@\n%@",self.FilePath.stringValue,[self FindinString:STR withregex:@"(?<=\\=).*"]];
    
    self.ReturnStr = OUTSTR;
    self.FilePath.stringValue =@"";
    
}

-(NSString *)RunCMD:(NSString *)CMD {
    NSDictionary *error = [NSDictionary new];
    NSString *script =  [NSString stringWithFormat:@"do shell script \"%@\"",CMD ];
    NSAppleScript *appleScript = [[NSAppleScript new] initWithSource:script];
    NSAppleEventDescriptor *des = [appleScript executeAndReturnError:&error];
    return  des.stringValue;
}


@end
