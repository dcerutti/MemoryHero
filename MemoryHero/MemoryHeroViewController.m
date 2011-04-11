//
//  MemoryHeroViewController.m
//  MemoryHero
//
//  Created by Dan Cerutti on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MemoryHeroViewController.h"
#import "Song.h"
#import "Note.h"
#import "SongLibrary.h"
#import "NoteImage.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@implementation MemoryHeroViewController


-(IBAction)songsTouched{
    NSLog(@"songsButton");
    [songListPicker setHidden:![songListPicker isHidden]];
}

//-(IBAction)topLeftbutton{
//    NSLog(@"topLEFT");
//    [usrTurn addObject:@"tL"];
//    beatCount++;
//}

//-(IBAction)topRightButton{
//    NSLog(@"topRight");
//    [usrTurn addObject:@"tR"];
//    beatCount++;
//}

//-(IBAction)bottomLeftButton{
//    NSLog(@"bottomLeft");
//    [usrTurn addObject:@"bL"];
//    beatCount++;
//}

//-(IBAction)bottomRightButton{
//    NSLog(@"bottomRight");
//    [usrTurn addObject:@"bR"];
//    beatCount++;
//}

-(IBAction)topLeftButton{
    
    NSLog(@"topLEFT");
    
    SystemSoundID topLeftSound;
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"TopLeft" ofType:@"wav"]], &topLeftSound);
    AudioServicesPlaySystemSound (topLeftSound);
    
    [usrTurn addObject:@"tL"];
    beatCount++;
    
}

-(IBAction)topRightButton{
    
    NSLog(@"topRight");
    
    SystemSoundID topRightSound;
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"TopRight" ofType:@"wav"]], &topRightSound);
    AudioServicesPlaySystemSound (topRightSound);
    
    [usrTurn addObject:@"tR"];
    beatCount++;
    
}

-(IBAction)bottomLeftButton{
    
    NSLog(@"bottomLeft");
    
    SystemSoundID bottomLeftSound;
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"BottomLeft" ofType:@"wav"]], &bottomLeftSound);
    AudioServicesPlaySystemSound (bottomLeftSound);
    
    [usrTurn addObject:@"bL"];
    beatCount++;
    
    
}

-(IBAction)bottomRightButton{
    
    NSLog(@"bottomRight");
    
    SystemSoundID bottomRightSound;
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"BottomRight" ofType:@"wav"]], &bottomRightSound);
    AudioServicesPlaySystemSound (bottomRightSound);
    
    [usrTurn addObject:@"bR"];
    beatCount++;
    
    
}

- (void)dealloc
{
    [super dealloc];
}


-(void)moveNotes{
    
    BOOL flag = true;
    while(flag){
        
        [NSThread sleepForTimeInterval:0.0214285714];
        
        int count = [noteImages count];
        
        for(int i = 0; i < count; i++){
            
            NoteImage *temp = [noteImages objectAtIndex:i];
            
            if(!temp.didFinish){
                
                UIImageView *image = temp.image;
                
                CGPoint position = image.center;
                
                //hideNote
                if(position.x <= 30){
                    
                    dispatch_async( dispatch_get_main_queue(), ^{
                        
                        [image removeFromSuperview];
                        temp.didFinish = true;
                        
                        NSString *str = [temp.note getButtonRef];
                        NSLog(str);
                        UIButton *button;
                        
                        if(str == @"tR"){
                            button = tRButton;
                        }else if(str == @"tL"){
                            button = tLButton;
                        }else if(str == @"bL"){
                            button = bLButton;
                        }else if(str == @"bR"){
                            button = bRButton;
                        }
                        
                        if (!temp.isUserNote) {
                            [NSThread detachNewThreadSelector:@selector(buttonFlicker:) toTarget:self withObject:button];
                        }
                        
                    });
                    
                    if(temp.isLastNote){
                        flag = false;
                    }
                }
                
                //moveNote
                dispatch_async( dispatch_get_main_queue(), ^{
                    
                    CGPoint position = image.center;
                    position.x -= 4;
                    [image setCenter:position];
                    
                });
                
                
            }//endDidFinsh
            
            
        }//end forloop
        
        
    }//end while
    
    int count = [noteImages count];
    NSLog(@"DONE = %d",count);
    sleep(1);
    [audioPlayer stop];
}


//-(void)generator{
//    
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    
//    noteImages = [[NSMutableArray alloc]init];
//    [NSThread detachNewThreadSelector:@selector(moveNotes) toTarget:self withObject:nil];
//    [NSThread detachNewThreadSelector:@selector(playAudio) toTarget:self withObject:nil];
//    
//    SongLibrary *sL = [[SongLibrary alloc]init];
//    Song *litz = [sL getSong:0];
//    NSMutableArray *beats = [litz getBeat];
//    int count = [beats count];
//    
//    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];
//    
//    for(int i = 0; i < count; i++){
//        
//        Note *noteNow = [beats objectAtIndex:i];
//        float timeBeat = noteNow.timeStamp + 1.5;
//        
//        NSTimeInterval nowTime = [NSDate timeIntervalSinceReferenceDate];
//        NSTimeInterval totalTime = nowTime - startTime;
//        
//        float sleepTime = timeBeat - totalTime;
//        [NSThread sleepForTimeInterval:sleepTime];
//        
//        dispatch_async( dispatch_get_main_queue(), ^{
//            
//            NoteImage *temp = [[NoteImage alloc]init];
//            temp.note = noteNow;
//            [self.view addSubview:temp.image];
//            [noteImages addObject:temp];
//            
//            if(i == count - 1){
//                temp.isLastNote = true;
//            }
//            
//        });
//        
//    }
//    
//    [pool release];
//}


-(void)cpuNoteImagesGenerator{
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    noteImages = [[NSMutableArray alloc]init];
    [NSThread detachNewThreadSelector:@selector(moveNotes) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(playAudio) toTarget:self withObject:nil];
    SongLibrary *sL = [[SongLibrary alloc]init];
    Song *song = [sL getSong:2];
    NSMutableArray *beats = [song getBeat];
    int count = [beats count];
    
    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];
    
    for(int i = 0; i < count; i++){
        
        Note *noteNow = [beats objectAtIndex:i];
        float timeBeat = noteNow.timeStamp;
        NSTimeInterval nowTime = [NSDate timeIntervalSinceReferenceDate];
        NSTimeInterval totalTime = nowTime - startTime;
        
        float sleepTime = timeBeat - totalTime;
        [NSThread sleepForTimeInterval:sleepTime];
        
        dispatch_async( dispatch_get_main_queue(), ^{
            
            NoteImage *temp = [[NoteImage alloc]init];
            temp.isUserNote = false;
            temp.note = noteNow;
            [self.view addSubview:temp.image];
            [noteImages addObject:temp];
            
        });
        
    }
    [pool release];
}

-(void)usrNoteImagesGenerator {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    noteImages = [[NSMutableArray alloc]init];
    SongLibrary *sL = [[SongLibrary alloc]init];
    Song *song = [sL getSong:2];
    NSMutableArray *beats = [song getBeat];
    int count = [beats count];
    
    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];
    
    for(int i = 0; i < count; i++){
        
        Note *noteNow = [beats objectAtIndex:i];
        float timeBeat = noteNow.timeStamp + [song getBeatsPerMeasure];
        NSTimeInterval nowTime = [NSDate timeIntervalSinceReferenceDate];
        NSTimeInterval totalTime = nowTime - startTime;
        
        float sleepTime = timeBeat - totalTime;
        [NSThread sleepForTimeInterval:sleepTime];
        
        dispatch_async( dispatch_get_main_queue(), ^{
            
            NoteImage *temp = [[NoteImage alloc]init];
            temp.isUserNote = true;
            temp.note = noteNow;
            [self.view addSubview:temp.image];
            [noteImages addObject:temp];
            
            if(i == count - 1){
                temp.isLastNote = true;
            }
            
        });
        
    }
    
    [pool release];
}



-(void)viewDidLoad{
    [super viewDidLoad];
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/BG - Jack One.mp3", [[NSBundle mainBundle] resourcePath]]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [audioPlayer prepareToPlay];
    
    [songListPicker setHidden:YES];
    SongLibrary *sL = [[SongLibrary alloc] init];
    songList = [[NSMutableArray alloc] init];
    for (int i = 0; i < [sL getLibrarySize]; i++) {
        NSString *str = [[sL getSong:(i)]getName];
        [songList addObject:str];   
    }
    
    //[NSThread detachNewThreadSelector:@selector(generator) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(cpuNoteImagesGenerator) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(usrNoteImagesGenerator) toTarget:self withObject:nil];

    //Creates a new thread so program can continue
    //[NSThread detachNewThreadSelector:@selector(goSong) toTarget:self withObject:nil];
    scoreLabel.text = @"0";
    
}

//-(void)buttonFlicker:(UIButton *)button{
//    
//    dispatch_async( dispatch_get_main_queue(), ^{
//        [button setHighlighted:TRUE];
//    });
//    
//    [NSThread sleepForTimeInterval:.3];
//    
//    dispatch_async( dispatch_get_main_queue(), ^{
//        [button setHighlighted:FALSE];
//    });
//    
//}

-(void)buttonFlicker:(UIButton *)button{
    
    SystemSoundID sound;
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[button currentTitle] ofType:@"wav"]], &sound);
    AudioServicesPlaySystemSound (sound);
    
    dispatch_async( dispatch_get_main_queue(), ^{
        [button setHighlighted:TRUE];
    });
    
    [NSThread sleepForTimeInterval:.3];
    
    dispatch_async( dispatch_get_main_queue(), ^{
        [button setHighlighted:FALSE];
    });
    
    
}

-(void)playAudio{
    [NSThread sleepForTimeInterval:1.9];
    NSError *error;
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/BG - Jack One.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [audioPlayer prepareToPlay];
    
    [NSThread sleepForTimeInterval:4.8];
    audioPlayer.numberOfLoops = 0;
    if (audioPlayer == nil)
        
        NSLog([error description]);
    
    else
        [audioPlayer play];
}


// PICKER VIEW METHODS
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerVie
{
	return 1;  // # columns
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component 
{ 
	return [songList count];  // # rows
    
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component { 
	return [songList objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // WHAT TO DO WHEN A SONG IS CHOSEN???
}

//Play First Measure
-(void)goSong{
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    dispatch_async( dispatch_get_main_queue(), ^{
        status.text = @"wait";
        
    });
    
    Song *firstSong = [[Song alloc] init];
    Note *firstNote;
    //Create Fake Song
    firstNote = [[Note alloc] set:@"tL"];
    [firstSong addNote:firstNote];
    firstNote = [[Note alloc] set:@"tR"];
    [firstSong addNote:firstNote];
    firstNote = [[Note alloc] set:@"bR"];
    [firstSong addNote:firstNote];
    firstNote = [[Note alloc] set:@"bL"];
    [firstSong addNote:firstNote];
    
    
    //set global song to song created
    currentSong = firstSong;
    NSMutableArray *beat = [firstSong getBeat];
    
    int size = [beat count];
    Note *note;
    for(int i = 0;i < size;i++){
        
        
        note = [beat objectAtIndex:i];
        NSString *str = [note getButtonRef];
        NSLog(str);
        UIButton *button;
        
        if(str == @"tR"){
            button = tRButton;
        }else if(str == @"tL"){
            button = tLButton;
        }else if(str == @"bL"){
            button = bLButton;
        }else if(str == @"bR"){
            button = bRButton;
        }
        
        //signals main thread to make UI change
        dispatch_async( dispatch_get_main_queue(), ^{
            [button setHighlighted:TRUE];
        });
        
        sleep(1);
        
        //signals main thread to make UI change
        dispatch_async( dispatch_get_main_queue(), ^{
            [button setHighlighted:FALSE];
        });
        
    }
    
    
    [NSThread detachNewThreadSelector:@selector(usrTurn) toTarget:self withObject:nil];
    [pool release];
}

//method that runs while usr is typing pattern

-(void)usrTurn{
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    dispatch_async( dispatch_get_main_queue(), ^{
        status.text = @"GO!";
    });
    
    usrTurn = [[NSMutableArray alloc]init];
    NSMutableArray *beat = [currentSong getBeat];
    beatCount = -1;
    NSString *strUsr;
    NSString *strCS;
    Note *csNote;
    BOOL escapeFlag = true;
    int score = 0;//temp
    while(escapeFlag){
        
        
        //right now it waits for u to match pattern but it will eventually wait based on time.
        if(beatCount != -1){
            
            sleep(.1);
            strUsr = [usrTurn objectAtIndex:beatCount];
            strCS = [[beat objectAtIndex:beatCount] getButtonRef];
            csNote = [beat objectAtIndex:beatCount];
            
            
            if(!csNote.didCheck){
                
                csNote.didCheck = TRUE;
                
                if(strUsr == strCS){
                    
                    score++;
                    dispatch_async( dispatch_get_main_queue(), ^{
                        status.text = @"Great!";
                        //Everytime a button is correctly hit, score increases by 300. We can change increment later if we like especially when it comes to the beat
                        int scoreboard = 0;
                        scoreboard = score * 300;
                        scoreLabel.text = [NSString stringWithFormat:@"%d",scoreboard];
                        
                    });
                    
                }else{
                    
                    dispatch_async( dispatch_get_main_queue(), ^{
                        status.text = @"BAD!";
                        //Everytime a button is correctly hit, score increases by 300. We can change increment later if we like especially when it comes to the beat
                        int scoreboard = 0;
                        scoreboard = score * 300;
                        scoreLabel.text = [NSString stringWithFormat:@"%d",scoreboard];
                    });
                }
                
            }
            
        }
        
        
        if(beatCount == [beat count] - 1){
            escapeFlag = false;
        }
        
        
    }
    
    dispatch_async( dispatch_get_main_queue(), ^{
        status.text = [NSString stringWithFormat:@"%d/%d Correct", score,[beat count]];
    });
    
    [pool release];
    [usrTurn release];
    usrTurn = NULL;
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
