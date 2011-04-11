//
//  NoteImage.h
//  MemoryHero
//
//  Created by Dan Cerutti on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Note;

@interface NoteImage : NSObject {
    
    UIImageView *image;
    Note *note;
    BOOL didFinsh;
    BOOL isLastNote;
    BOOL isUserNote;
}

@property (nonatomic, retain)UIImageView *image;
@property (nonatomic, retain)Note *note;
@property (nonatomic) BOOL didFinish;
@property (nonatomic) BOOL isLastNote;
@property (nonatomic) BOOL isUserNote;
-(void)changePicture:(NSString *)pic;

@end
