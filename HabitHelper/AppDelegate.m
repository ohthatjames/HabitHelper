//
//  AppDelegate.m
//  HabitHelper
//
//  Created by James Hunt on 07/05/2013.
//  Copyright (c) 2013 James Hunt. All rights reserved.
//

#import "AppDelegate.h"
#import "PopupWindowController.h"

@interface AppDelegate()
@property (strong, nonatomic) PopupWindowController *popupWindow;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.popupWindow = [[PopupWindowController alloc] initWithWindowNibName: @"PopupWindowController"];
    [self showPopup: nil];
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(showPopup:) userInfo:nil repeats:YES];
}

- (void)showPopup:(NSTimer *)timer
{
    [self.popupWindow showWindow:self];
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hidePopup:) userInfo:nil repeats:NO];
}

- (void)hidePopup:(NSTimer *)timer
{
    [self.popupWindow close];
}

@end
