//
//  MemoryHeroViewController.h
//  MemoryHero
//
//  Created by Dan Cerutti on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.  Don't forget that this is open source.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class Song;

@interface MemoryHeroViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    
    IBOutlet UILabel *scoreLabel;
    IBOutlet UIButton *tLButton;
    IBOutlet UIButton *tRButton;
    IBOutlet UIButton *bRButton;
    IBOutlet UIButton *bLButton;
    IBOutlet UILabel *status;
    IBOutlet UIPickerView *songListPicker;
    IBOutlet UIButton *songListButton;
    
    // Global time for music and notes to sync
    NSTimeInterval globalTime;
    //Song List variables
    NSMutableArray *songList;
    
    //Tracker variables
    NSMutableArray *noteImages;
    AVAudioPlayer *audioPlayer;
    
    //temp variables
    NSMutableArray *usrTurn;
    Song *currentSong;
    int beatCount;
    
}

-(void)cpuNoteImagesGenerator;
-(void)usrNoteImagesGenerator;
-(void)moveNotes;
-(void)playAudio;
-(void)buttonFlicker:(UIButton *)button;

-(void)goSong;
-(void)usrTurn;
-(IBAction)topLeftButton;
-(IBAction)topRightButton;
-(IBAction)bottomLeftButton;
-(IBAction)bottomRightButton;
-(IBAction)songsTouched;
@end
