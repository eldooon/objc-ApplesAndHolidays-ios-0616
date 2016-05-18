//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray *) pickApplesFromFruits:(NSArray *)fruits;{
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self == %@", @"apple"]; //filter, if predicate is equal to apple string
    NSArray *appleArray = [fruits filteredArrayUsingPredicate:applePredicate]; //new array using predicate filter

    return appleArray; //return apple
}

-(NSArray *) holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableArray *onlyHoliday = database[season]; //pull all holiday keys
    
    return onlyHoliday; //return array with holiday
}

-(NSArray *) suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableArray *suppliesSeason = database[season][holiday]; //pull all supplies
    
    return suppliesSeason; //return new array with supplies
}

-(BOOL) holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    BOOL matchHoliday = NO; //initiate to return false by default
    
    
    if ([database[season] objectForKey:holiday]){ //if season contain holiday arguement
            
            matchHoliday = YES; //return true
    }
    
    return matchHoliday; //return BOOL
    
}

-(BOOL) supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    BOOL containSupply = NO;//initiate to return false by default
    
    if ([database[season][holiday] containsObject:supply]){ //if holiday contain supply arguement
        
        return containSupply = YES; //return true
    }
    
    return containSupply; //return BOOL
}

-(NSDictionary *) addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableArray *newValue = [[NSMutableArray alloc]init]; //new empty array

    [database[season] setObject:newValue forKey:holiday]; //set empty array for new key holiday arguement

    return database; //return modified database
}

-(NSDictionary *) addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    [database[season][holiday] addObject:supply]; //add supply arguement into holiday
    return database; //return modified database
}
@end