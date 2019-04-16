//
//  DBModel.m
//  Person Information
//
//  Created by Akhilesh Bhatia on 04/03/2019.
//  Copyright © 2019 Akhilesh Bhatia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBModel.h" //to import the declarations in the header file

@implementation DBModel

//utility methods
- (NSString *) getBundlePath{
    NSString * path1 = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/People.rdb"];
   // NSLog(@"Bundle Paths: %@\n\n", path1);
   // NSString * path = [[NSBundle mainBundle] pathForResource:@"People" ofType:@"rdb"]; // adding @ because its an NSString
    return path1;
}

- (NSString *) getDocumentsPath{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * path = [paths[0] stringByAppendingString:@"/People.rdb"];
    return path;
}

//initializer to make people.rdb available in Documents (in order to both update and read the database. If its in the bundle, then it can only be read and not update)
- (id) init{
    self = [super init];
    
    //get the paths
    NSString * bundlePath = [self getBundlePath];
    //NSLog(@"Bundle Paths: %@\n\n", bundlePath);
    NSString * docsPath = [self getDocumentsPath];
    //NSLog(@"Docs Paths: %@\n\n", docsPath);
    //make a file manager
    NSFileManager * manager = [NSFileManager defaultManager];
    
    //copy the database if needed
    if([manager fileExistsAtPath:docsPath] == NO){
        [manager copyItemAtPath:bundlePath toPath:docsPath error:NULL];
    }
    
    return self;
}

//declare the database
static sqlite3 * database;

//database work
- (void) openDB{
    NSString * path = [self getDocumentsPath];
    //everything in sqlite uses a C string. The above is a NSString * so we convert it
    char * pathStr = (char *)[path UTF8String];
    BOOL error = sqlite3_open(pathStr, &database);
    
    if(error != SQLITE_OK){
        NSLog(@"DB cannot open");
    }else{
        NSLog(@"DB can open");
    }
}

- (void) closeDB{
    sqlite3_close(database);
}

- (NSArray *) allPeople{
    //open DB
    [self openDB];
    
    //make the query and a statement
    char * queryStr = "select * from people";
    static sqlite3_stmt * statement;
    BOOL error = sqlite3_prepare(database, queryStr, -1, &statement, NULL);
    if(error != SQLITE_OK){
        NSLog(@"DB cannot prepare statment");
    }else{
        NSLog(@"DB can prepare statment");
    }
    //steps while possible to extract the data
    NSMutableArray * peopleData = [[NSMutableArray alloc] initWithCapacity:200];
    
    //traverse the query results
    while(sqlite3_step(statement) == SQLITE_ROW){
        //get the text from a column and save it
        char * nameStr = (char  *)sqlite3_column_text(statement, 1);
        NSString * name = [NSString stringWithUTF8String:nameStr];
        
        char * phoneStr = (char  *)sqlite3_column_text(statement, 2);
        NSString * phone = [NSString stringWithUTF8String:phoneStr];
        
        char * addressStr = (char  *)sqlite3_column_text(statement, 3);
        NSString * address = [NSString stringWithUTF8String:addressStr];
        
        char * imageStr = (char  *)sqlite3_column_text(statement, 4);
        NSString * image = [NSString stringWithUTF8String:imageStr];
        
        char * urlStr = (char  *)sqlite3_column_text(statement, 5);
        NSString * url = [NSString stringWithUTF8String:urlStr];
        
        NSLog(@"%@ \n", name);
        
        [peopleData addObject:@[name,phone,address,image,url]];
    }
    NSLog(@"Number of rows %d\n", peopleData.count);
    return peopleData;
}



@end
