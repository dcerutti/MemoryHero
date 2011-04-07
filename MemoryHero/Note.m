//
//  Note.m
//  MemoryHero
//
//  Created by Dan Cerutti on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Note.h"


@implementation Note
@synthesize didCheck,timeStamp;

-(Note *)set:(NSString *)buttonRef{
    
    button = buttonRef;
    didCheck = false;
    return self;
}

-(Note *)set:(NSString *)buttonRef :(double)time{
    
    button = buttonRef;
    timeStamp = time;
    return self;
}


-(NSString *)getButtonRef{
    return button;
}

-(void)dealloc{
    [button release];
    [super dealloc];
}

@end
