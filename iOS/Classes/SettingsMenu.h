//
//  SettingsMenu.h
//  prototype
//
//  Created by Ari Ronen on 11/4/10.
//  This project is licensed under the GNU General Public License v3. See https://github.com/JosephTheEngineer/Eden for more info.
//

#ifndef Eden_SettingsMenu_h
#define Eden_SettingsMenu_h



#import "Texture2D.h"
#import "Input.h"
typedef struct
{
	int value;
	NSString* name;
	CGRect box;
	Texture2D* tex;
}
property;
#define NUM_PROP 5
class SettingsMenu
{
public:
    SettingsMenu();
    void update(float etime);
    void render();
    void save();
    void load();
    NSString* getNewWorldName();
	
	CGRect rect_settings;
	
	Button rect_save;
	
	Button rect_on[NUM_PROP];
	
	CGRect rect_off;	
	int world_counter;
	property properties[NUM_PROP];
};

#endif
