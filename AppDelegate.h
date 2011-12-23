//
//  AppDelegate.h
//  SyncScrollView
//
//  Created by Yidi Hou on 27/12/10.
//  Copyright 2010 SFU. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject {
	NSMutableArray *list;
	IBOutlet NSTableView *tableviewLeft,*tableviewRight;
}

@end
