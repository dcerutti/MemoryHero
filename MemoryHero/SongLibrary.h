//
//  SongLibrary.h
//  MemoryHero
//
//  Created by Dan Cerutti on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"


@interface SongLibrary : NSObject {
    
    NSMutableArray *library;
    
}

-(Song *)getSong:(NSInteger)index;
-(void)firstSong;
-(int)getLibrarySize;

@end
