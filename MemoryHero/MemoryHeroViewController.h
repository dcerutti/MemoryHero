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

@interface MemoryHeroViewController : UIViewController {
    
    IBOutlet UILabel *scoreLabel;
    IBOutlet UIButton *tLButton;
    IBOutlet UIButton *tRButton;
    IBOutlet UIButton *bRButton;
    IBOutlet UIButton *bLButton;
    IBOutlet UILabel *status;
    
    //Tracker variables
    NSMutableArray *noteImages;
    AVAudioPlayer *audioPlayer;
    
    //temp variables
    NSMutableArray *usrTurn;
    Song *currentSong;
    int beatCount;
    
}

-(void)generator;
-(void)moveNotes;
-(void)playAudio;

-(void)goSong;
-(void)usrTurn;
-(IBAction)topLeftButton;
-(IBAction)topRightButton;
-(IBAction)bottomLeftButton;
-(IBAction)bottomRightButton;

@end
