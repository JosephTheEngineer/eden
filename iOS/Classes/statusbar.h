//
//  statusbar.h
//  prototype
//
//  Created by Ari Ronen on 11/9/10.
//  This project is licensed under the GNU General Public License v3. See https://github.com/JosephTheEngineer/Eden for more info.
//

#ifndef Eden_statusbar_h
#define Eden_statusbar_h



#import "Graphics.h"

class statusbar {
public:
    statusbar(CGRect rect);
    statusbar(CGRect rect,float font_size);
    void setStatus(NSString* status, float time);
    void setStatus(NSString* status, float time,NSTextAlignment align);
    void clear();
    void update(float etime);
    void render();
    void renderPlain();
    CGRect pos;
private:
	
	Texture2D* text;
    NSString* __weak message;
	float textlife;
	float font_size;
};

#endif
