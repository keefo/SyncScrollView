//
//  SyncScrollView.h
//  SyncScrollView
//
//  Created by Yidi Hou on 27/12/10.
//  Copyright 2010 SFU. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SyncScrollView : NSScrollView {
	IBOutlet NSScrollView* synchronizedScrollView;
	BOOL synchronized;
}

- (IBAction)toggleSynchronizing:(id)sender;

@end
