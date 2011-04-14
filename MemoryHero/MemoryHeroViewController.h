//
//  MemoryHeroViewController.h
//  MemoryHero
//
//  Created by Dan Cerutti on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.  Don't forget that this is open source.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class Song,SongLibrary;

@interface MemoryHeroViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    
    IBOutlet UILabel *scoreLabel;
    IBOutlet UIButton *tLButton;
    IBOutlet UIButton *tRButton;
    IBOutlet UIButton *bRButton;
    IBOutlet UIButton *bLButton;
    IBOutlet UILabel *status;
    IBOutlet UIPickerView *songListPicker;
    IBOutlet UIButton *songListButton;
    IBOutlet UIButton *play;
    IBOutlet UIButton *pause;
    NSTimeInterval startTime;
    
    //Song Library
    SongLibrary *songLibrary;
    
    //Song List variables
    NSMutableArray *songList;
    
    //Tracker variables
    NSMutableArray *noteImages;
    AVAudioPlayer *audioPlayer;
    
    //temp variables
    BOOL songDone;
    NSMutableArray *usrTurn;
    Song *currentSong;
    int beatCount;
    
}

-(void)imageNoteGenerator;
-(void)moveNotes;
-(void)playAudio;
-(void)buttonFlicker:(UIButton *)button;
-(void)usrInput;

-(void)goSong;
-(void)usrTurn;
-(IBAction)topLeftButton;
-(IBAction)topRightButton;
-(IBAction)bottomLeftButton;
-(IBAction)bottomRightButton;
-(IBAction)songsTouched;
@end
