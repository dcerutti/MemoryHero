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
    
}

-(Note *) set:(NSString *)buttonRef;
-(NSString *)getButtonRef;


@end
