//
//  NoteImage.m
//  MemoryHero
//
//  Created by Dan Cerutti on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoteImage.h"


@implementation NoteImage
@synthesize image,didFinish,isLastNote,isUserNote,note;

-(id)init{
    didFinish = false;
    isLastNote = false;
    isUserNote = false;
    CGRect myImageRect = CGRectMake(310,183, 20.0f, 20.0f); 
    image = [[UIImageView alloc] initWithFrame:myImageRect];
    [image setImage:[UIImage imageNamed:@"circle.png"]];
    image.opaque = YES; // explicitly opaque for performance
    
    return self;
}

-(void)changePicture:(NSString *)pic{
     [image setImage:[UIImage imageNamed:pic]];
}

@end
