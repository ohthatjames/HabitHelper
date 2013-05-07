//
//  AppDelegate.m
//  HabitHelper
//
//  Created by James Hunt on 07/05/2013.
//  Copyright (c) 2013 James Hunt. All rights reserved.
//

#import "AppDelegate.h"
#import "PopupWindowController.h"
#import "PreferenceWindowController.h"

@interface AppDelegate()
@property (strong, nonatomic) PopupWindowController *popupWindow;
@property (retain) PreferenceWindowController *preferencesWindow;
@property (retain) NSTimer *timer;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self setDefaults];
    self.popupWindow = [[PopupWindowController alloc] initWithWindowNibName: @"PopupWindowController"];
    [self resetTimer];
    [self showPreferences:nil];
}

-(IBAction)showPreferences:(id)sender{
    if(!self.preferencesWindow) {
        self.preferencesWindow = [[PreferenceWindowController alloc] initWithWindowNibName:@"PreferenceWindowController"];
    }
    
    [self.preferencesWindow showWindow:self];
}

- (void)resetTimer
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    float repeatInterval = [[NSUserDefaults standardUserDefaults] floatForKey: @"repeatInterval"];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:repeatInterval * 60 target:self selector:@selector(showPopup:) userInfo:nil repeats:YES];
    [self showPopup: nil];
}

- (void)showPopup:(NSTimer *)timer
{
    [self.popupWindow showWindow:nil];
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hidePopup:) userInfo:nil repeats:NO];
}

- (void)hidePopup:(NSTimer *)timer
{
    [self.popupWindow close];
}

- (void)setDefaults
{
    [[NSUserDefaults standardUserDefaults] setFloat:5.0 forKey:@"repeatInterval"];
    [[NSUserDefaults standardUserDefaults] setObject:@"POSTURE" forKey:@"habitMessage"];
    // TODO: There must be a way of observing everything...
    [[NSUserDefaults standardUserDefaults] addObserver:self forKeyPath:@"repeatInterval" options:NSKeyValueObservingOptionNew context:nil];
    [[NSUserDefaults standardUserDefaults] addObserver:self forKeyPath:@"habitMessage" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self resetTimer];
}
@end
