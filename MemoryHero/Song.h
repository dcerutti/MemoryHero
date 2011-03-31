//
//  Song.h
//  MemoryHero
//
//  Created by Dan Cerutti on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"


@interface Song : NSObject {
    
    NSMutableArray *beat;
    
}

-(void)addNote:(Note *)note;
-(void)printNotes;
-(NSMutableArray *)getBeat;

@end
