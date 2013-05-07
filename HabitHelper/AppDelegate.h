//
//  AppDelegate.h
//  HabitHelper
//
//  Created by James Hunt on 07/05/2013.
//  Copyright (c) 2013 James Hunt. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSStatusItem *statusItem;
    IBOutlet NSMenu *menu;
}

@property (assign) IBOutlet NSWindow *window;

@end
