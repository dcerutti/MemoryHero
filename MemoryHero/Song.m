//
//  Song.m
//  MemoryHero
//
//  Created by Dan Cerutti on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Song.h"


@implementation Song


-(id)init{
    
    beat = [[NSMutableArray alloc] init];
    
    return self;
}


-(void)addNote:(Note *)note{
    [beat addObject:note];
}

-(void)printNotes{
    
    NSLog(@"Size = %d",[beat count]);
    for(int i = 0; i < [beat count]; i++){
        Note *temp = [beat objectAtIndex:i];
        NSString *str = [temp getButtonRef];
        NSLog(str);
    }
    
}

-(void)dealloc{
    [beat release];
    [super dealloc];
}

@end
