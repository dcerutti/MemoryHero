//
//  SongLibrary.m
//  MemoryHero
//
//  Created by Dan Cerutti on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SongLibrary.h"


@implementation SongLibrary

-(id)init{
    
    library = [[NSMutableArray alloc] init];
    return self;
}

-(Song *)getSong:(NSInteger)index{
    return [library objectAtIndex:index]; 
}



@end
