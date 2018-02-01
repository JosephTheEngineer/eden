//
//  ShareMenu.h
//  prototype
//
//  Created by Ari Ronen on 11/16/10.
//  This project is licensed under the GNU General Public License v3. See https://github.com/JosephTheEngineer/Eden for more info.
//


#ifndef Eden_ShareMenu_h
#define Eden_ShareMenu_h

#import <Foundation/Foundation.h>
#import "World.h"
#import "Menu.h"
#import "Util.h"

class ShareMenu{
public:
    ShareMenu();
	WorldNode* node;
	CGRect input_background;
	Button rect_cancel;
	Button rect_submit;
  
	CGRect share_explain_rect;
	statusbar* share_explain_lbl;
	statusbar* label_bar;
	statusbar* name_bar;
      NSMutableString* displays;
	NSMutableString* name;
 
	//BOOL starto;
    
    void trimDisplay();
    void beginShare(WorldNode* world);
    void endShare(BOOL cancel);
    void activate();
    void deactivate();
    void update(float etime);
    void render();
    void keyTyped(char c);
};



#endif
