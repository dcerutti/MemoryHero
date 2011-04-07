//
//  NoteImage.h
//  MemoryHero
//
//  Created by Dan Cerutti on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NoteImage : NSObject {
    
    UIImageView *image;
    BOOL didFinsh;
    BOOL isLastNote;
    
}

@property (nonatomic, retain)UIImageView *image;
@property (nonatomic) BOOL didFinish;
@property (nonatomic) BOOL isLastNote;

-(void)changePicture:(NSString *)pic;

@end
