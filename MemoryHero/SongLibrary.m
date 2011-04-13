//
//  SongLibrary.m
//  MemoryHero
//
//  Created by Dan Cerutti on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SongLibrary.h"


@implementation SongLibrary

-(id)init{
    library = [[NSMutableArray alloc] init];
    [self firstSong];
    [self secondSong];
    [self randomSong];
    [self bestShot];
    return self;
}

-(Song *)getSong:(NSInteger)index{
    return [library objectAtIndex:index]; 
}

-(void)setSong:(Song *)song{
    [library addObject:song];
}

-(int)getLibrarySize {
    return [library count];
}

-(void)firstSong{
    Song *songBuild = [[Song alloc] init];
    [songBuild setName:@"litz"];
    Note *noteBuild;
    noteBuild = [[Note alloc]set:@"tR" :2.365];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :2.405];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :2.59];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :2.71];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :2.87];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :3.013];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :3.174];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :3.326];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :3.486];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :3.63];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :3.797];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :3.949];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :4.102];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :4.221];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :4.389];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :4.533];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :4.678];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :4.806];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :4.942];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :5.054];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :5.213];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :5.366];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :5.51];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :5.654];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :5.83];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :5.982];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :6.142];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :6.294];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :6.454];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :6.565];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :6.75];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :6.87];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :7.046];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :7.342];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :7.526];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :7.806];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :8.158];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :8.294];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :8.486];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :8.774];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :9.07];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :9.486];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :9.814];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :9.99];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :10.261];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :10.589];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :10.743];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :10.918];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :11.181];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :11.51];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :11.918];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :12.27];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :12.462];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :12.733];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :13.054];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :13.182];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :13.366];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :13.646];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :13.982];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :14.405];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :14.742];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :14.926];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :15.222];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :15.582];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :15.734];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :15.894];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :16.022];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :16.166];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :16.31];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :16.453];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :16.613];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :17.806];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :18.11];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :18.406];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :18.726];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :19.014];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :20.246];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :20.51];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :20.878];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :21.053];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :21.342];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :21.654];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :22.062];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :22.365];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :22.709];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :22.886];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :23.014];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :23.334];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :23.558];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :23.814];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :24.15];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :24.774];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :25.406];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :25.934];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :26.55];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :26.91];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :27.11];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :27.326];
    [songBuild addNote:noteBuild];
    
    [self setSong:songBuild];
}



-(void)secondSong {
    
    Song *songBuild = [[Song alloc] init];
    Note *noteBuild;
    [songBuild setName:@"Jack One"];
    [songBuild setBeatsPerMeasure:16];
    noteBuild = [[Note alloc]set:@"tL" :3.922];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :19.989];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :20.913];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :35.97];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :36.939];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :38.403];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :51.975];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :52.983];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :54.455];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :54.972];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :68.003];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :68.971];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :70.443];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :70.964];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :71.49];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :83.997];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :84.965];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :86.485];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :86.957];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :87.453];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :87.957];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :99.993];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :100.984];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :102.464];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :102.968];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :103.408];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :103.936];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :104.455];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :115.977];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :116.89];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :118.498];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :119.018];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :119.466];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :119.946];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :120.441];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :120.969];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :132.042];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :132.978];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :134.426];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :134.931];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :135.448];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :135.93];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :136.418];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :136.987];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :137.898];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :148.003];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :149.027];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :150.471];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :150.956];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :151.467];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :151.941];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :152.435];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :152.954];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :154.008];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :154.405];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :163.988];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :165.003];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :166.403];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :166.985];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :167.476];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :167.994];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :168.46];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :168.996];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :169.966];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :170.46];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :170.98];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :179.924];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :180.997];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :182.465];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :182.941];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :183.453];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :183.959];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :184.429];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :184.981];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :186.021];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :186.469];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :186.933];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :187.485];
    [songBuild addNote:noteBuild];
    [self setSong:songBuild];
    
}

-(void)randomSong {
    Song *songBuild = [[Song alloc] init];
    Note *noteBuild;
    [songBuild setName:@"Random"];
    [songBuild setBeatsPerMeasure:16];
    NSString *tempRef;
    int tempInt;
    float tempTime = 0;
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    NSMutableArray *currentPattern = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++) {
        tempInt = arc4random() % 4;

        if (tempInt == 0)
            tempRef = @"tL";
        else if (tempInt == 1)
            tempRef = @"tR";
        else if (tempInt == 2)
            tempRef = @"bL";
        else if (tempInt == 3)
            tempRef = @"bR";
        else
            NSLog(@"Mistake with random song");
        
        tempInt = arc4random() % 9;
        
        NSLog(@"%f", tempTime);
        tempTime = (((float)tempInt / 10) + i);
        NSLog(@"%f", tempTime);
        noteBuild = [[Note alloc]set:tempRef :tempTime];
        [currentPattern addObject:noteBuild];
        
        for (int x = 0; x < [currentPattern count]; x++) {
            noteBuild = [[Note alloc]set:[[currentPattern objectAtIndex:x]getButtonRef] :[[currentPattern objectAtIndex:x]getTime]];
            tempTime = [noteBuild getTime];
            [noteBuild setTime:(tempTime + (i * 16))];
            [newArray addObject:noteBuild];
        }
    }
    
    for (int j = 0; j < [newArray count]; j++) {
        noteBuild = [[Note alloc]set:[[newArray objectAtIndex:j]getButtonRef] :[[newArray objectAtIndex:j]getTime]];
        [songBuild addNote:noteBuild];
    }
    
    [self setSong:songBuild];
}

-(void)bestShot{
    Song *songBuild = [[Song alloc] init];
    Note *noteBuild;
    noteBuild = [[Note alloc]set:@"tR" :3.503 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :4.223 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :4.471 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :5.183 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :5.415 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :5.863 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :6.071 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :9.207 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :9.959 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :10.143 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :10.791 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :11.007 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :11.455 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :11.655 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :12.903 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :13.663 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :13.847 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :14.527 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :14.775 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :15.279 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :15.479 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :20.383 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :21.583 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :21.839 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :22.063 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :22.303 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :23.527 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :23.743 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :23.959 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :24.199 :FALSE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :29.855 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :30.991 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :31.239 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :31.479 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :31.703 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :32.879 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :33.103 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :33.319 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :33.543 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :37.295 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :38.503 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :38.711 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :38.943 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :39.183 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :40.359 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :40.607 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :40.823 :TRUE];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :41.063 :TRUE];
    [songBuild addNote:noteBuild];
    
    [self setSong:songBuild];//index 3
}

@end
