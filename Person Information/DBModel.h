//
//  DBModel.h
//  Person Information
//
//  Created by Akhilesh Bhatia on 04/03/2019.
//  Copyright © 2019 Akhilesh Bhatia. All rights reserved.
//

#ifndef DBModel_h
#define DBModel_h


#endif /* DBModel_h */
#import <sqlite3.h>
#import <Foundation/Foundation.h>

@interface DBModel : NSObject

//declare methods - messages
- (void) openDB;
- (void) closeDB;
- (NSArray *) allPeople;



@end
