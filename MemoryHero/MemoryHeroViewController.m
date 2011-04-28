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

-(IBAction)playTouched{
    pauseBankEnd = [NSDate timeIntervalSinceReferenceDate];
    pauseBankTotal = pauseBankEnd - pauseBankStart;
    [play setHidden:YES];
    [pause setHidden:NO];
    [audioPlayer play];
    isPause = FALSE;
   
    
}
-(IBAction)pauseTouched{
    pauseBankStart = [NSDate timeIntervalSinceReferenceDate];
    [pause setHidden:YES];
    [play setHidden:NO];
    [audioPlayer pause];
    isPause = TRUE;                                                        
}



-(IBAction)songsTouched{
    NSLog(@"songsButton");
    [songListPicker setHidden:![songListPicker isHidden]];
}

-(IBAction)topLeftbutton{
    NSLog(@"topLEFT");
    [usrTurn addObject:@"tL"];
    beatCount++;
}

-(IBAction)topRightButton{
    NSLog(@"topRight");
    [usrTurn addObject:@"tR"];
    beatCount++;
}

-(IBAction)bottomLeftButton{
    NSLog(@"bottomLeft");
    [usrTurn addObject:@"bL"];
    beatCount++;
}

-(IBAction)bottomRightButton{
    NSLog(@"bottomRight");
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
            while(isPause) {}
            
            NoteImage *temp = [noteImages objectAtIndex:i];
            
            if(!temp.didFinish){
                
                UIImageView *image = temp.image;
                
                CGPoint position = image.center;
                
                //hideNote
                if(position.x <= 30){
                    
                    dispatch_async( dispatch_get_main_queue(), ^{
                        
                        //NSTimeInterval nowTime = [NSDate timeIntervalSinceReferenceDate];
                        //NSTimeInterval totalTime = nowTime - startTime;
                        
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
                        
                        if (!temp.note.isUSR) {
                            [NSThread detachNewThreadSelector:@selector(buttonFlicker:) toTarget:self withObject:button];
                        }
                        
                    });
                    
                    if(temp.isLastNote){
                        flag = false;
                    }
                } //endPosition < 30
                
                //moveNote
                dispatch_async( dispatch_get_main_queue(), ^{
                    
                    CGPoint position = image.center;
                    position.x -= 4;
                    [image setCenter:position];
                    
                });
                
                
            }//endDidFinsh
            
            
        }//end forloop
        
        
    }//end while
    
    songDone = TRUE;
    int count = [noteImages count];
    NSLog(@"DONE = %d",count);
    sleep(1);
    [audioPlayer stop];
}


-(void)imageNoteGenerator{
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    songDone =  false;
    noteImages = [[NSMutableArray alloc]init];
    [NSThread detachNewThreadSelector:@selector(moveNotes) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(playAudio) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(usrInput) toTarget:self withObject:nil];
    
    songLibrary = [[SongLibrary alloc]init];
    Song *songSelected = [songLibrary getSong:picker];
    NSMutableArray *beats = [songSelected getBeat];
    int count = [beats count];
    
    startTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval pauseTotal = 0;
    for(int i = 0; i < count; i++){
        
        while(isPause){}
        // keep track of how long the game has been paused 
        // so that you can subtract that amount of time from the
        // "totalTime" the game has been running
        pauseTotal += pauseBankTotal;
        pauseBankTotal = 0;
        
        NSTimeInterval nowTime = [NSDate timeIntervalSinceReferenceDate];
        NSTimeInterval totalTime = nowTime - (startTime + pauseTotal);
        
        Note *noteNow = [beats objectAtIndex:i];
        float timeBeat = noteNow.timeStamp + 1.5;
        
        float sleepTime = timeBeat - totalTime;
        NSTimeInterval sleepStart = [NSDate timeIntervalSinceReferenceDate];
        [NSThread sleepForTimeInterval:sleepTime];
        NSTimeInterval sleepEnd = [NSDate timeIntervalSinceReferenceDate];
        // if note is ready to come onto the screen but the game is paused
        // have the thread sleep for the amount of the time the game is paused until
        // it's unpaused
        while(isPause) {}
        if ((pauseBankStart > sleepStart) && (pauseBankStart < sleepEnd) && (pauseBankStart != 0))
            sleepTime = sleepEnd - pauseBankStart;
        else
            sleepTime = 0;
        pauseTotal += pauseBankTotal;
        pauseBankTotal = 0;
        [NSThread sleepForTimeInterval:sleepTime];
        dispatch_async( dispatch_get_main_queue(), ^{
            
            NoteImage *temp = [[NoteImage alloc]init];
            temp.note = noteNow;
            if([temp.note getButtonRef] == @"tR"){
                [temp changePicture:@"blueNote.png"];
            }else if([temp.note getButtonRef] == @"tL"){
                [temp changePicture:@"redNote.png"];
            }else if([temp.note getButtonRef] == @"bL"){
                [temp changePicture:@"greenNote.png"];
            }else if([temp.note getButtonRef] == @"bR"){
                [temp changePicture:@"yellowNote.png"];
            }
            
            if(temp.note.isUSR){
               [temp changePicture:@"whiteNote.png"];
                //status.text = @"GO!";
            }else{
                //status.text = @"REMEMBER!";
            }
            
            [self.view addSubview:temp.image];
            [noteImages addObject:temp];
            
            if(i == count - 1){
                temp.isLastNote = true;
            }
            
        });
        
    }
    
    [pool release];
}

-(void)usrInput{
    usrTurn = [[NSMutableArray alloc]init];
    NSMutableArray *usrReference = [[NSMutableArray alloc]init];
    Song *songSelected = [songLibrary getSong:picker];//to hardcoded.
    NSMutableArray *beat = [songSelected getBeat];
    beatCount = -1;
    NSString *strUsr;
    NSString *strCS;
    Note *csNote;
    int score = 0;//temp
    
    //pulls only the notes that the user is responsible for
    for(Note *note in beat){
        if(note.isUSR){
            [usrReference addObject:note];
        }
    }
    
    while(!songDone){
        
        //right now it waits for u to match pattern but it will eventually wait based on time.
        if(beatCount != -1){
            
            sleep(.1);
            strUsr = [usrTurn objectAtIndex:beatCount];
            strCS = [[usrReference objectAtIndex:beatCount] getButtonRef];
            csNote = [usrReference objectAtIndex:beatCount];
            
            
            if(!csNote.didCheck){
                
                csNote.didCheck = TRUE;
                
                NSTimeInterval nowTime = [NSDate timeIntervalSinceReferenceDate];
                NSTimeInterval totalTime = nowTime - startTime;
                if(strUsr == strCS){
                    
                    double pressDown = fabs(csNote.timeStamp + 3.0 - totalTime);
                    
                    NSLog(@"PRESSDOWN DIFF = %f",pressDown);
                    
                    if(pressDown < .2){
                    score++;
                    dispatch_async( dispatch_get_main_queue(), ^{
                        status.text = @"Great!";
                        //Everytime a button is correctly hit, score increases by 300. We can change increment later if we like especially when it comes to the beat
                        int scoreboard = 0;
                        scoreboard = score * 300;
                        scoreLabel.text = [NSString stringWithFormat:@"%d",scoreboard];
                        
                    });
                        
                    }
                    
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
        
    }
    
    [usrReference release];
}


-(void)viewDidLoad{
    [super viewDidLoad];
    [play setHidden:YES];
    pauseBankTotal = 0;
    pauseBankStart = 0;
    pauseBankEnd = 0;
    songLibrary = [[SongLibrary alloc]init];
    
    [songListPicker setHidden:NO];
    SongLibrary *sL = [[SongLibrary alloc] init];
    songList = [[NSMutableArray alloc] init];
    for (int i = 0; i < [sL getLibrarySize]; i++) {
        NSString *str = [[sL getSong:(i)]getName];
        [songList addObject:str];   
    }
    
    scoreLabel.text = @"0";
}


-(void)buttonFlicker:(UIButton *)button{
    
    
    dispatch_async( dispatch_get_main_queue(), ^{
        [button setHighlighted:TRUE];
    });
    
    [NSThread sleepForTimeInterval:.1];
    
    dispatch_async( dispatch_get_main_queue(), ^{
        [button setHighlighted:FALSE];
    });
    
    
}

-(void)playAudio{
    [NSThread sleepForTimeInterval:2.9];
    NSError *error;
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bestShot.wav", [[NSBundle mainBundle] resourcePath]]];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [audioPlayer prepareToPlay];
    
    //[NSThread sleepForTimeInterval:4.8];
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
    //Right now this only works correctly on start up. If you begin the song and you want to change it to another song it will create another thread while the first one is still going. NSInteger picker is also used in this function to tell imageGenerator what song to get. Instead of using "Song *bestShot = [songLibrary getSong:3];" we now use "Song *selectedSong = [songLibrary getSong:picker];" letting the row selected decide which song to get. 
    
        if (row == 3){
            NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bestShot.wav", [[NSBundle mainBundle] resourcePath]]];
            NSError *error;
            audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
            [audioPlayer prepareToPlay];
        
            picker = 3;
        
            [NSThread detachNewThreadSelector:@selector(imageNoteGenerator) toTarget:self withObject:nil];
            
        }
    
    [songListPicker setHidden:YES];
    
    
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
