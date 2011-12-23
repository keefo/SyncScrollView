//
//  AppDelegate.m
//  SyncScrollView
//
//  Created by Yidi Hou on 27/12/10.
//  Copyright 2010 SFU. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (void)awakeFromNib
{
	list=[[NSMutableArray alloc] init];
	for (int i=1; i<=1000; i++) {
		[list addObject:[NSString stringWithFormat:@"title %d",i]];
	}
	
	[tableviewLeft reloadData];
	[tableviewRight reloadData];
}

- (void)dealloc
{
	[list release];
	[super dealloc];
}

#pragma mark -
#pragma mark TableView DataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
	return [list count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
	return [list objectAtIndex:rowIndex];
}

@end
