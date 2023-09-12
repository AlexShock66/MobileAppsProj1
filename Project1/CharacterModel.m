//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "CharacterModel.h"
@interface CharacterModel ()

@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSDictionary* imageDict;
@property (strong,nonatomic) NSDictionary* plist;

@end


@implementation CharacterModel



@synthesize plist = _plist;
@synthesize imageNames = _imageNames;
@synthesize imageDict= _imageDict;

+(CharacterModel*)sharedInstance{
    static CharacterModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[CharacterModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = self.plist[@"ports"];
    
    return _imageNames;
}

-(NSDictionary*) plist {
    NSLog(@"Lazy load plist");
    if (!_plist){
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"charInfo" ofType:@"plist"];
        _plist = [NSDictionary dictionaryWithContentsOfFile:plistPath];
//        NSLog(_plist[@"classes"][0]);
    }
    return _plist;
}
-(NSDictionary*) imageDict{
    if (!_imageDict){
        NSMutableArray *values = [[NSMutableArray alloc] init];
        NSArray *keys = self.plist[@"ports"];
        
        for(id obj in keys) {
//            NSLog(obj);
            [values addObject:[self loadImageWithName:obj]];
        }
//        [values enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
//            values[idx] = [self loadImageWithName:object];
//        }];
        _imageDict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    }
    
    return _imageDict;
}

-(UIImage*)loadImageWithName:(NSString*)name{
    UIImage* image = nil;
    
    image = [UIImage imageNamed:name];
    
    return image;
}

-(UIImage*)getPortWithName:(NSString*)name{
    return self.imageDict[name];
}

-(UIImage*)getPortWithIndex:(NSInteger)index{
    return self.imageDict[self.imageNames[index]];
}

-(NSString*)getPortNameForIndex:(NSInteger)index{
    return self.imageNames[index];
}
    
-(NSInteger)numberOfPorts{

    return [self.imageNames count];
    
}

-(NSArray*)getCharacters{
    return self.plist[@"characters"];
}

-(NSArray*)getClasses{
    return self.plist[@"classes"];
}

-(NSInteger)numberOfCharacters {
    
    return [[self.plist objectForKey:@"characters"] count];
}
-(NSDictionary*)getCharacterWithIndex:(NSInteger)index {
//    return self.plist[@"characters"][index];
    return [self.plist objectForKey:@"characters"][index];
}


-(NSInteger)numberOfWeapons{
    return [[[self.plist objectForKey:@"inventory"] objectForKey:@"weapons" ]count];
}

-(NSInteger)numberOfArmors{
    return [[[self.plist objectForKey:@"inventory"] objectForKey:@"armors" ]count];
}

-(NSInteger)numberOfCybernetics{
    return [[[self.plist objectForKey:@"inventory"] objectForKey:@"cyberwares" ]count];
}

-(NSDictionary*)getWeaponWithIndex:(NSInteger)index{
   return  [[self.plist objectForKey:@"inventory"] objectForKey:@"weapons"][index];
}

-(NSDictionary*)getArmorWithIndex:(NSInteger)index{
    return [[self.plist objectForKey:@"inventory"] objectForKey:@"armors" ][index];
}

-(NSString*)getCyberneticWithIndex:(NSInteger)index{
    return [[self.plist objectForKey:@"inventory"] objectForKey:@"cyberwares"][index];
}

-(UIImage *)getWeaponImageFor:(NSString*)name{
    return [self loadImageWithName:name];
}
@end
