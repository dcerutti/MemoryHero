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

@implementation MemoryHeroViewController

-(IBAction)topLeftButton{
    
    NSLog(@"topLEFT");
    
    if(usrTurn != NULL){
        [usrTurn addObject:@"tL"];
        beatCount++;
    }
    
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

-(void)tempNote{
    
    
    CGRect myImageRect = CGRectMake(310,183, 20.0f, 20.0f); 
    UIImageView *myImage = [[UIImageView alloc] initWithFrame:myImageRect];
    dispatch_async( dispatch_get_main_queue(), ^{
        
        //CGRect myImageRect = CGRectMake(310,183, 20.0f, 20.0f); 
        //UIImageView *myImage = [[UIImageView alloc] initWithFrame:myImageRect];
        [myImage setImage:[UIImage imageNamed:@"circle.png"]];
        myImage.opaque = YES; // explicitly opaque for performance
        [self.view addSubview:myImage];
        //[myImage release];

        
    });
    
    Boolean flag = true;
    
    
    int x = 310;
    while(flag){
        
        x -= 4;
        
        [NSThread sleepForTimeInterval:0.0214285714];
        
        dispatch_async( dispatch_get_main_queue(), ^{
            
            CGPoint position = myImage.center;
            position.x -= 4;
            [myImage setCenter:position];
            
        });
        
        if( x < 30){
            flag = false;
        }
        
    }
    

    [myImage removeFromSuperview];
    [myImage release];
 
}

-(void)moveOne:(UIImageView *)picture{
    CGPoint position = picture.center;
    position.x -= 5;
    [picture setCenter:position];
}


-(void)generator{
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    for(int i = 0; i < 4; i++){
//        [NSThread detachNewThreadSelector:@selector(tempNote) toTarget:self withObject:nil];
//        sleep(1);
//    }
//    
    
    SongLibrary *sL = [[SongLibrary alloc]init];
    Song *litz = [sL getSong:0];
    NSMutableArray *beats = [litz getBeat];
    int count = [beats count];
    
    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];

    for(int i = 0; i < count; i++){
        
        Note *noteNow = [beats objectAtIndex:i];
        float timeBeat = noteNow.timeStamp + 1.5;
        
        NSTimeInterval nowTime = [NSDate timeIntervalSinceReferenceDate];
        NSTimeInterval totalTime = nowTime - startTime;
        
        float sleepTime = timeBeat - totalTime;
        [NSThread sleepForTimeInterval:sleepTime];
        
        [NSThread detachNewThreadSelector:@selector(tempNote) toTarget:self withObject:nil];
        
    }
    
    
        
       [pool release];
}

-(void)viewDidLoad{
    
    [NSThread detachNewThreadSelector:@selector(generator) toTarget:self withObject:nil];
    
    //Creates a new thread so program can continue
    [NSThread detachNewThreadSelector:@selector(goSong) toTarget:self withObject:nil];
    scoreLabel.text = @"0";
    
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
