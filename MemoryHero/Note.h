//
//  Note.h
//  MemoryHero
//
//  Created by Dan Cerutti on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Note : NSObject {
    
    NSString *button;
    double timeStamp;
    BOOL didCheck;
    
}

@property (nonatomic)BOOL didCheck;
@property (nonatomic)double timeStamp;

-(Note *) set:(NSString *)buttonRef;
-(Note *) set:(NSString *)buttonRef:(double)time;
-(NSString *)getButtonRef;


@end
