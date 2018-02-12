//
//  DownloadManager.h
//  Eden
//
//  Created by Ari Ronen on 6/21/11.
//  This project is licensed under the GNU General Public License v3. See https://github.com/JosephTheEngineer/Eden for more info.
//


#ifndef Eden_FileDownload_h
#define Eden_FileDownload_h

#import <Foundation/Foundation.h>


@interface FileDownload : NSObject {
	NSURL *serverURL;
    NSString *filePath;
    id delegate;
    SEL doneSelector;
    SEL errorSelector;
	SEL progressSelector;
    BOOL downloadDidSucceed;
    NSURLConnection* connection;
    NSData* result;
    NSOutputStream* fileStream;
}

-   (id)initWithURL: (NSURL *)serverURL 
		   filePath: (NSString *)filePath 
		   delegate: (id)delegate 
	   doneSelector: (SEL)doneSelector 
	  errorSelector: (SEL)errorSelector
 progressSelector: (SEL)progressSelector;

+ (NSData*)downloadFile:(NSString*)file_name;
-(void)cancel;
@property(nonatomic,assign)   NSData* result;
@end


#endif
