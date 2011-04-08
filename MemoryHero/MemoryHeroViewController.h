//
//  Song.m
//  MemoryHero
//
//  Created by Dan Cerutti on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

<<<<<<< HEAD
#import <UIKit/UIKit.h>
=======
#import "Song.h"
>>>>>>> ebe8fe60cc765fa1bbcdef392f2efbcaca5f0976


<<<<<<< HEAD
@interface MemoryHeroViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    
    IBOutlet UILabel *scoreLabel;
    IBOutlet UIButton *tLButton;
    IBOutlet UIButton *tRButton;
    IBOutlet UIButton *bRButton;
    IBOutlet UIButton *bLButton;
    IBOutlet UILabel *status;
    IBOutlet UIPickerView *songListPicker;
    IBOutlet UIButton *songListButton;
    
    //Song List variables
    NSMutableArray *songList;
    
    //Tracker variables
    NSMutableArray *noteImages;
=======
@implementation Song


-(id)init{
    beat = [[NSMutableArray alloc] init];
    name = [[NSString alloc] init];
    return self;
}

-(void)addNote:(Note *)note{
    [beat addObject:note];
}

-(NSMutableArray *)getBeat{
    return beat;
}

-(void)printNotes{
>>>>>>> ebe8fe60cc765fa1bbcdef392f2efbcaca5f0976
    
    NSLog(@"Size = %d",[beat count]);
    for(int i = 0; i < [beat count]; i++){
        Note *temp = [beat objectAtIndex:i];
        NSString *str = [temp getButtonRef];
        NSLog(str);
    }
    
}

<<<<<<< HEAD
-(void)generator;
-(void)moveNotes;

-(void)goSong;
-(void)usrTurn;
-(IBAction)topLeftButton;
-(IBAction)topRightButton;
-(IBAction)bottomLeftButton;
-(IBAction)bottomRightButton;
-(IBAction)songsTouched;
=======
-(void)setName:(NSString *)songName{
    name = songName;
}

-(NSString *)getName{
    return name;
}

-(void)dealloc{
    [beat release];
    [super dealloc];
}

>>>>>>> ebe8fe60cc765fa1bbcdef392f2efbcaca5f0976
@end
