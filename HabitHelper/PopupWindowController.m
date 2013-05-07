//
//  PopupWindowController.m
//  HabitHelper
//
//  Created by James Hunt on 07/05/2013.
//  Copyright (c) 2013 James Hunt. All rights reserved.
//

#import "PopupWindowController.h"

@interface PopupWindowController ()

@end

@implementation PopupWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    [self.window setLevel:NSFloatingWindowLevel];
    [self.window setIgnoresMouseEvents: YES];
}

@end
