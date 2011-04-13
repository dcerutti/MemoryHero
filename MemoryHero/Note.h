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
    BOOL isUSR,didCheck,lastNote;
    
}

@property (nonatomic)BOOL isUSR;
@property (nonatomic)BOOL didCheck;
@property (nonatomic)double timeStamp;

-(Note *) set:(NSString *)buttonRef;
-(Note *) set:(NSString *)buttonRef:(double)time;
-(Note *) set:(NSString *)buttonRef:(double)time:(BOOL)isUSER;
-(NSString *)getButtonRef;
-(void)setTime:(float)time;
-(float)getTime;


@end
