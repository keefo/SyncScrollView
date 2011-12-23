//
//  SyncScrollView.m
//  SyncScrollView
//
//  Created by Yidi Hou on 27/12/10.
//  Copyright 2010 SFU. All rights reserved.
//

#import "SyncScrollView.h"


@implementation SyncScrollView

- (void)removeSynchronizingNotification
{
    if (synchronizedScrollView != nil) {
		NSView* synchronizedContentView = [synchronizedScrollView contentView];
		[[NSNotificationCenter defaultCenter] removeObserver:self
														name:NSViewBoundsDidChangeNotification
													  object:synchronizedContentView];
		synchronizedScrollView=nil;
    }	
}

- (void)setSynchronizedScrollView:(NSScrollView*)scrollview
{	
	[self removeSynchronizingNotification];
    synchronizedScrollView = scrollview;
	NSView *synchronizedContentView=[synchronizedScrollView contentView];
	[synchronizedContentView setPostsBoundsChangedNotifications:YES];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(synchronizedViewContentBoundsDidChange:)
												 name:NSViewBoundsDidChangeNotification
											   object:synchronizedContentView];
	synchronized=YES;
}

- (void)synchronizedViewContentBoundsDidChange:(NSNotification *)notification
{
    NSClipView *changedContentView=[notification object];
    NSPoint changedBoundsOrigin = [changedContentView documentVisibleRect].origin;;
	
    NSPoint curOffset = [[self contentView] bounds].origin;
    NSPoint newOffset = curOffset;
	
    newOffset.y = changedBoundsOrigin.y;
	
    if (!NSEqualPoints(curOffset, changedBoundsOrigin))
    {
		[[self contentView] scrollToPoint:newOffset];
		[self reflectScrolledClipView:[self contentView]];
    }	
}


- (IBAction)toggleSynchronizing:(id)sender
{
	if (synchronized) {
		NSView* synchronizedContentView = [synchronizedScrollView contentView];
		[[NSNotificationCenter defaultCenter] removeObserver:self
														name:NSViewBoundsDidChangeNotification
													  object:synchronizedContentView];
    }else {
		NSView *synchronizedContentView=[synchronizedScrollView contentView];
		[synchronizedContentView setPostsBoundsChangedNotifications:YES];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(synchronizedViewContentBoundsDidChange:)
													 name:NSViewBoundsDidChangeNotification
												   object:synchronizedContentView];
	}
	
	synchronized=!synchronized;
}

@end
