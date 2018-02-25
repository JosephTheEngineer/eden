//
//  Globals.m
//  prototype
//
//  Created by Ari Ronen on 10/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "EAGLView.h"
#import "Constants.h"

float SCREEN_WIDTH;
float SCREEN_HEIGHT;
float SCALE_WIDTH;
float SCALE_HEIGHT;
float P_ASPECT_RATIO;
float P_ZFAR;
BOOL IS_WIDESCREEN;
BOOL IS_IPAD;  //This flag gets set for ipad AND 'retina' devices, which is basically all supported devices these days.
BOOL IS_RETINA;
BOOL SUPPORTS_RETINA=FALSE;
BOOL CREATURES_ON;
BOOL LOW_MEM_DEVICE;
BOOL LOW_GRAPHICS;

EAGLView* G_EAGL_VIEW;

int g_offcx,g_offcz;

extern "C" const int blockinfo[NUM_BLOCKS+1]={
	[TYPE_NONE]=IS_NOTSOLID,
	[TYPE_BEDROCK]=0|IS_HARD,
	[TYPE_SAND]=0,
	[TYPE_GRASS]=IS_GRASS|IS_COLOREDSPECIAL,
	[TYPE_GRASS2]=IS_GRASS|IS_COLOREDSPECIAL,
	[TYPE_GRASS3]=IS_GRASS|IS_COLOREDSPECIAL,
	[TYPE_DARK_STONE]=0|IS_HARD,
	[TYPE_DIRT]=0,
	[TYPE_STONE]=0|IS_HARD,
	[TYPE_WOOD]=IS_FLAMMABLE|IS_HARD,
	
	[TYPE_TREE]=IS_FLAMMABLE,
	[TYPE_LEAVES]=IS_FLAMMABLE,
	[TYPE_DOOR1]=IS_FLAMMABLE|IS_NOTSOLID|IS_OBJECT|IS_DOOR,
    [TYPE_DOOR2]=IS_FLAMMABLE|IS_NOTSOLID|IS_OBJECT|IS_DOOR,
    [TYPE_DOOR3]=IS_FLAMMABLE|IS_NOTSOLID|IS_OBJECT|IS_DOOR,
    [TYPE_DOOR4]=IS_FLAMMABLE|IS_NOTSOLID|IS_OBJECT|IS_DOOR,
    [TYPE_DOOR_TOP]=IS_FLAMMABLE|IS_NOTSOLID|IS_OBJECT|IS_DOOR,
    [TYPE_PORTAL1]=IS_OBJECT|IS_PORTAL|IS_HARD,
    [TYPE_PORTAL2]=IS_OBJECT|IS_PORTAL|IS_HARD,
    [TYPE_PORTAL3]=IS_OBJECT|IS_PORTAL|IS_HARD,
    [TYPE_PORTAL4]=IS_OBJECT|IS_PORTAL|IS_HARD,
    [TYPE_PORTAL_TOP]=IS_OBJECT|IS_PORTAL|IS_HARD,
    [TYPE_GOLDEN_CUBE]=IS_NOTSOLID|IS_OBJECT,
    [TYPE_FLOWER]=IS_NOTSOLID|IS_OBJECT|IS_FLAMMABLE,
    [TYPE_LIGHTBOX]=0|IS_HARD,
//   [TYPE_CUSTOM]=IS_NOTSOLID,
	[TYPE_TNT]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD,
    [TYPE_FIREWORK]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD,
    [TYPE_BLOCK_TNT]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
	[TYPE_BRICK]=IS_COLOREDSPECIAL|IS_HARD,
    [TYPE_STEEL]=0|IS_HARD,
	[TYPE_COBBLESTONE]=0|IS_HARD,
	[TYPE_ICE]=IS_ICE|IS_FLAMMABLE|IS_FLAMMABLE,
	[TYPE_CRYSTAL]=0|IS_HARD,
    
	[TYPE_TRAMPOLINE]=0,
    [TYPE_LADDER]=IS_FLAMMABLE|IS_HARD,
    [TYPE_CLOUD]=0,
    [TYPE_WATER]=IS_NOTSOLID|IS_ATLAS2|IS_WATER|IS_LIQUID,
    [TYPE_WATER1]=IS_NOTSOLID|IS_ATLAS2|IS_WATER|IS_LIQUID,
    [TYPE_WATER2]=IS_NOTSOLID|IS_ATLAS2|IS_WATER|IS_LIQUID,
    [TYPE_WATER3]=IS_NOTSOLID|IS_ATLAS2|IS_WATER|IS_LIQUID,
    [TYPE_LAVA]=IS_NOTSOLID|IS_ATLAS2|IS_LAVA|IS_LIQUID,
    [TYPE_LAVA1]=IS_NOTSOLID|IS_ATLAS2|IS_LAVA|IS_LIQUID,
    [TYPE_LAVA2]=IS_NOTSOLID|IS_ATLAS2|IS_LAVA|IS_LIQUID,
    [TYPE_LAVA3]=IS_NOTSOLID|IS_ATLAS2|IS_LAVA|IS_LIQUID,
    
    [TYPE_VINE]=0|IS_FLAMMABLE,
    [TYPE_WEAVE]=IS_FLAMMABLE|IS_NOTSOLID|IS_ATLAS2|IS_HARD,
    [TYPE_SHINGLE]=0|IS_HARD,
    [TYPE_GLASS]=IS_NOTSOLID|IS_ATLAS2|IS_HARD,
    [TYPE_GRADIENT]=0,
    
    
    [TYPE_STONE_RAMP1]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE|IS_HARD,
    [TYPE_STONE_RAMP2]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE|IS_HARD,
    [TYPE_STONE_RAMP3]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE|IS_HARD,
    [TYPE_STONE_RAMP4]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE|IS_HARD,
    [TYPE_ICE_RAMP1]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE|IS_ICE|IS_FLAMMABLE,
    [TYPE_ICE_RAMP2]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE|IS_ICE|IS_FLAMMABLE,
    [TYPE_ICE_RAMP3]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE|IS_ICE|IS_FLAMMABLE,
    [TYPE_ICE_RAMP4]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE|IS_ICE|IS_FLAMMABLE,
    
    [TYPE_SHINGLE_RAMP1]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE,
    [TYPE_SHINGLE_RAMP2]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE,
    [TYPE_SHINGLE_RAMP3]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE,
    [TYPE_SHINGLE_RAMP4]=IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE,
    
    [TYPE_WOOD_RAMP1]=IS_FLAMMABLE|IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE,
    [TYPE_WOOD_RAMP2]=IS_FLAMMABLE|IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE,
    [TYPE_WOOD_RAMP3]=IS_FLAMMABLE|IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE,
    [TYPE_WOOD_RAMP4]=IS_FLAMMABLE|IS_NOTSOLID|IS_RAMP|IS_RAMPORSIDE,
    
    [TYPE_STONE_SIDE1]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    [TYPE_STONE_SIDE2]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    [TYPE_STONE_SIDE3]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    [TYPE_STONE_SIDE4]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    
    [TYPE_SHINGLE_SIDE1]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    [TYPE_SHINGLE_SIDE2]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    [TYPE_SHINGLE_SIDE3]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    [TYPE_SHINGLE_SIDE4]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    
    [TYPE_ICE_SIDE1]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_ICE|IS_FLAMMABLE,
    [TYPE_ICE_SIDE2]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_ICE|IS_FLAMMABLE,
    [TYPE_ICE_SIDE3]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_ICE|IS_FLAMMABLE,
    [TYPE_ICE_SIDE4]=IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_ICE|IS_FLAMMABLE,
    
    [TYPE_WOOD_SIDE1]=IS_FLAMMABLE|IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    [TYPE_WOOD_SIDE2]=IS_FLAMMABLE|IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    [TYPE_WOOD_SIDE3]=IS_FLAMMABLE|IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    [TYPE_WOOD_SIDE4]=IS_FLAMMABLE|IS_NOTSOLID|IS_SIDE|IS_RAMPORSIDE|IS_HARD,
    
    
    [TYPE_BTGRASS]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
    [TYPE_BTDARKSTONE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
    [TYPE_BTSTONE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
    [TYPE_BTDIRT]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
    [TYPE_BTSAND]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
    [TYPE_BTTNT]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
    [TYPE_BTWOOD]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
    [TYPE_BTSHINGLE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTGLASS]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTGRADIENT]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTTREE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTLEAVES]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTBRICK]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTCOBBLESTONE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTVINES]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTLADDER]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTICE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTCRYSTAL]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTTRAMPOLINE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTCLOUD]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTSTONESIDE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTWOODSIDE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTICESIDE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTSHINGLESIDE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTFENCE]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTWATER]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTLAVA]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTFIREWORK]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTLIGHTBOX]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,
   [ TYPE_BTSTEEL]=IS_FLAMMABLE|IS_COLOREDSPECIAL|IS_HARD|IS_BLOCKTNT,

    
	
};

extern "C" const GLubyte creatureColor[NUM_CREATURES+1][3]={
    [M_MOOF]={70,70,255},
    [M_GREEN]={115,206,74},
    [M_NERGLE]={255,70,255},
    [M_BATTY]={255,70,255},
    [M_STUMPY]={255,165,0},
    [M_STALKER]={235,20,0},
    [M_CHARGER]={235,20,0},
   
    
};
extern "C" const GLubyte blockColor[NUM_BLOCKS+1][3]={
	[TYPE_NONE]={0},
	[TYPE_BEDROCK]={90,90,90},
	[TYPE_DARK_STONE]={120,120,120},
	[TYPE_SAND]={255,231,148},
    [TYPE_GRASS]={115,206,74},
    [TYPE_GRASS2]={133,227,79},
    [TYPE_GRASS3]={115,206,74},
    
	/*[TYPE_GRASS]={80,175,30},
	[TYPE_GRASS2]={80,175,30},
	[TYPE_GRASS3]={80,156,39},*/
	[TYPE_DIRT]={118,79,5},
	[TYPE_STONE]={198,198,198},
	[TYPE_WOOD]={230,202,109},	
    [TYPE_DOOR1]={230-50,202-50,109-50},	
    [TYPE_DOOR2]={230-50,202-50,109-50},
    [TYPE_DOOR3]={230-50,202-50,109-50},
    [TYPE_DOOR4]={230-50,202-50,109-50},
    [TYPE_DOOR_TOP]={230-50,202-50,109-50},
    [TYPE_PORTAL1]={90,90,90},
    [TYPE_PORTAL2]={90,90,90},
    [TYPE_PORTAL3]={90,90,90},
    [TYPE_PORTAL4]={90,90,90},
    [TYPE_PORTAL_TOP]={90,90,90},
    [TYPE_GOLDEN_CUBE]={200,160,75},
    [TYPE_FLOWER]={93,163,255},
    [TYPE_LIGHTBOX]={255,255,150},
   // [TYPE_CUSTOM]={198,198,198},
	[TYPE_TREE]={136,99,24},
	[TYPE_LEAVES]={30,180,40},	
	[TYPE_TNT]={229,207,170},
    [TYPE_FIREWORK]={229,207,170},
    [TYPE_BLOCK_TNT]={229,207,170},
	[TYPE_BRICK]={255,60,57},
	[TYPE_COBBLESTONE]={162,170,178},
	[TYPE_ICE]={145,178,201},	
	[TYPE_CRYSTAL]={255,255,255},
	[TYPE_TRAMPOLINE]={125,125,125},
    [TYPE_LADDER]={230,202,109},
    [TYPE_CLOUD]={255,255,255},
 
    [TYPE_WATER]={32,43,255},
    [TYPE_WATER1]={32,43,255},
    [TYPE_WATER2]={32,43,255},
    [TYPE_WATER3]={32,43,255},
    [TYPE_LAVA]={253,70,0},
    [TYPE_LAVA1]={253,70,0},
    [TYPE_LAVA2]={253,70,0},
    [TYPE_LAVA3]={253,70,0},
    [TYPE_WEAVE]={235,196,110},
    [TYPE_VINE]={0,255,0},
    [TYPE_STONE_RAMP1]={198,198,198},
    [TYPE_STONE_RAMP2]={198,198,198},
    [TYPE_STONE_RAMP3]={198,198,198},
    [TYPE_STONE_RAMP4]={198,198,198},
    [TYPE_STONE_SIDE1]={198,198,198},
    [TYPE_STONE_SIDE2]={198,198,198},
    [TYPE_STONE_SIDE3]={198,198,198},
    [TYPE_STONE_SIDE4]={198,198,198},
    [TYPE_WOOD_RAMP1]={230,202,109},
    [TYPE_WOOD_RAMP2]={230,202,109},
    [TYPE_WOOD_RAMP3]={230,202,109},
    [TYPE_WOOD_RAMP4]={230,202,109},
    [TYPE_WOOD_SIDE1]={230,202,109},
    [TYPE_WOOD_SIDE2]={230,202,109},
    [TYPE_WOOD_SIDE3]={230,202,109},
    [TYPE_WOOD_SIDE4]={230,202,109},
    [TYPE_ICE_RAMP1]={145,178,201},
    [TYPE_ICE_RAMP2]={145,178,201},
    [TYPE_ICE_RAMP3]={145,178,201},
    [TYPE_ICE_RAMP4]={145,178,201},
    [TYPE_ICE_SIDE1]={145,178,201},
    [TYPE_ICE_SIDE2]={145,178,201},
    [TYPE_ICE_SIDE3]={145,178,201},
    [TYPE_ICE_SIDE4]={145,178,201},
    [TYPE_SHINGLE_SIDE1]={200,200,200},
    [TYPE_SHINGLE_SIDE2]={200,200,200},
    [TYPE_SHINGLE_SIDE3]={200,200,200},
    [TYPE_SHINGLE_SIDE4]={200,200,200},
    [TYPE_SHINGLE]={200,200,200},
    [TYPE_SHINGLE_RAMP1]={200,200,200},
    [TYPE_SHINGLE_RAMP2]={200,200,200},
    [TYPE_SHINGLE_RAMP3]={200,200,200},
    [TYPE_SHINGLE_RAMP4]={200,200,200},
    [TYPE_GLASS]={255,255,255},
    [TYPE_GRADIENT]={255,255,255},
    [TYPE_STEEL]={255,255,255},
    [TYPE_BTGRASS]={229,207,170},
    [TYPE_BTDARKSTONE]={229,207,170},
    [TYPE_BTSTONE]={229,207,170},
    [TYPE_BTDIRT]={229,207,170},
    [TYPE_BTSAND]={229,207,170},
    [TYPE_BTTNT]={229,207,170},
    [TYPE_BTWOOD]={229,207,170},
    [TYPE_BTSHINGLE]={229,207,170},
    [TYPE_BTGLASS]={229,207,170},
    [TYPE_BTGRADIENT]={229,207,170},
    [TYPE_BTTREE]={229,207,170},
    [TYPE_BTLEAVES]={229,207,170},
    [TYPE_BTBRICK]={229,207,170},
    [TYPE_BTCOBBLESTONE]={229,207,170},
    [TYPE_BTVINES]={229,207,170},
    [TYPE_BTLADDER]={229,207,170},
    [TYPE_BTICE]={229,207,170},
    [TYPE_BTCRYSTAL]={229,207,170},
    [TYPE_BTTRAMPOLINE]={229,207,170},
    [TYPE_BTCLOUD]={229,207,170},
    [TYPE_BTSTONESIDE]={229,207,170},
    [TYPE_BTWOODSIDE]={229,207,170},
    [TYPE_BTICESIDE]={229,207,170},
    [TYPE_BTSHINGLESIDE]={229,207,170},
    [TYPE_BTFENCE]={229,207,170},
    [TYPE_BTWATER]={229,207,170},
    [TYPE_BTLAVA]={229,207,170},
    [TYPE_BTFIREWORK]={229,207,170},
    [TYPE_BTLIGHTBOX]={229,207,170},
    [TYPE_BTSTEEL]={229,207,170},

    
    
    
	
};

extern "C" const int blockTypeFaces[NUM_BLOCKS+1][6]={
	[TYPE_NONE]={0},
	[TYPE_BEDROCK]={TEX_DARK_STONE,TEX_DARK_STONE,TEX_DARK_STONE,TEX_DARK_STONE,TEX_DARK_STONE,TEX_DARK_STONE},
	[TYPE_SAND]={TEX_SAND,TEX_SAND,TEX_SAND,TEX_SAND,TEX_SAND,TEX_SAND},
	[TYPE_GRASS]={TEX_GRASS_SIDE,TEX_GRASS_SIDE,TEX_GRASS_SIDE,TEX_GRASS_SIDE,TEX_DIRT,TEX_GRASS_TOP},
	[TYPE_DIRT]={TEX_DIRT,TEX_DIRT,TEX_DIRT,TEX_DIRT,TEX_DIRT,TEX_DIRT},
	[TYPE_STONE]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
	[TYPE_WOOD]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_DOOR1]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_DOOR2]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_DOOR3]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_DOOR4]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_DOOR_TOP]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_GOLDEN_CUBE]={TEX_CLOUD,TEX_CLOUD,TEX_CLOUD,TEX_CLOUD,TEX_CLOUD,TEX_CLOUD},
    [TYPE_FLOWER]={TEX_CLOUD,TEX_CLOUD,TEX_CLOUD,TEX_CLOUD,TEX_CLOUD,TEX_CLOUD},
    [TYPE_LIGHTBOX]={TEX_LIGHTBOX,TEX_LIGHTBOX,TEX_LIGHTBOX,TEX_LIGHTBOX,TEX_LIGHTBOX,TEX_LIGHTBOX},
  //  [TYPE_CUSTOM]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_PORTAL_TOP]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_PORTAL1]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_PORTAL2]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_PORTAL3]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_PORTAL4]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
	[TYPE_TREE]={TEX_TREE_SIDE,TEX_TREE_SIDE,TEX_TREE_SIDE,TEX_TREE_SIDE,TEX_TREE_VERT,TEX_TREE_VERT},
	[TYPE_LEAVES]={TEX_LEAVES,TEX_LEAVES,TEX_LEAVES,TEX_LEAVES,TEX_LEAVES,TEX_LEAVES},
	[TYPE_GRASS2]={TEX_GRASS_SIDE,TEX_GRASS_SIDE,TEX_GRASS_SIDE,TEX_GRASS_SIDE,TEX_DIRT,TEX_GRASS_TOP2},
	[TYPE_TNT]={TEX_TNT_SIDE,TEX_TNT_SIDE,TEX_TNT_SIDE,TEX_TNT_SIDE,TEX_TNT_SIDE,TEX_TNT_TOP},
    [TYPE_BLOCK_TNT]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_TNT_TOP},
	[TYPE_DARK_STONE]={TEX_BEDROCK,TEX_BEDROCK,TEX_BEDROCK,TEX_BEDROCK,TEX_BEDROCK,TEX_BEDROCK},
	[TYPE_GRASS3]={TEX_GRASS_SIDE,TEX_GRASS_SIDE,TEX_GRASS_SIDE,TEX_GRASS_SIDE,TEX_DIRT,TEX_GRASS_TOP},
    
	[TYPE_BRICK]={TEX_BRICK,TEX_BRICK,TEX_BRICK,TEX_BRICK,TEX_BRICK,TEX_BRICK},
	[TYPE_COBBLESTONE]={TEX_COBBLESTONE,TEX_COBBLESTONE,TEX_COBBLESTONE,TEX_COBBLESTONE,TEX_COBBLESTONE,TEX_COBBLESTONE},
	[TYPE_ICE]={TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE},
	[TYPE_CRYSTAL]={TEX_CRYSTAL,TEX_CRYSTAL,TEX_CRYSTAL,TEX_CRYSTAL,TEX_CRYSTAL,TEX_CRYSTAL},	
	[TYPE_TRAMPOLINE]={TEX_TRAMPOLINE,TEX_TRAMPOLINE,TEX_TRAMPOLINE,TEX_TRAMPOLINE,TEX_TRAMPOLINE,TEX_TRAMPOLINE},
    [TYPE_FIREWORK]={TEX_FIREWORK,TEX_FIREWORK,TEX_FIREWORK,TEX_FIREWORK,TEX_FIREWORK,TEX_TNT_TOP},
	
    [TYPE_LADDER]={TEX_LADDER,TEX_LADDER,TEX_LADDER,TEX_LADDER,TEX_WOOD,TEX_WOOD},
	[TYPE_CLOUD]={TEX_CLOUD,TEX_CLOUD,TEX_CLOUD,TEX_CLOUD,TEX_CLOUD,TEX_CLOUD},
    [TYPE_WATER]={TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER},
    [TYPE_WATER1]={TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER},
    [TYPE_WATER2]={TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER},
    [TYPE_WATER3]={TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER,TEX_WATER},
    [TYPE_WOOD_RAMP1]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_WOOD_RAMP2]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_WOOD_RAMP3]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_WOOD_RAMP4]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_WOOD_SIDE1]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_WOOD_SIDE2]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_WOOD_SIDE3]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_WOOD_SIDE4]={TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD,TEX_WOOD},
    [TYPE_ICE_RAMP1]={TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE},
    [TYPE_ICE_RAMP2]={TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE},
    [TYPE_ICE_RAMP3]={TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE},
    [TYPE_ICE_RAMP4]={TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE},
    [TYPE_ICE_SIDE1]={TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE},
    [TYPE_ICE_SIDE2]={TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE},
    [TYPE_ICE_SIDE3]={TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE},
    [TYPE_ICE_SIDE4]={TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE,TEX_ICE},
    [TYPE_SHINGLE_RAMP1]={TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE},
    [TYPE_SHINGLE_RAMP2]={TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE},
    [TYPE_SHINGLE_RAMP3]={TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE},
    [TYPE_SHINGLE_RAMP4]={TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE},
    [TYPE_SHINGLE_SIDE1]={TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE},
    [TYPE_SHINGLE_SIDE2]={TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE},
    [TYPE_SHINGLE_SIDE3]={TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE},
    [TYPE_SHINGLE_SIDE4]={TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE},
    [TYPE_STONE_RAMP1]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_STONE_RAMP2]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_STONE_RAMP3]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_STONE_RAMP4]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_STONE_SIDE1]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_STONE_SIDE2]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_STONE_SIDE3]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_STONE_SIDE4]={TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE,TEX_STONE},
    [TYPE_WEAVE]={TEX_WEAVE,TEX_WEAVE,TEX_WEAVE,TEX_WEAVE,TEX_WEAVE,TEX_WEAVE},
    [TYPE_LAVA]={TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA},
    [TYPE_LAVA1]={TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA},
    [TYPE_LAVA2]={TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA},
    [TYPE_LAVA3]={TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA,TEX_LAVA},
    [TYPE_VINE]={TEX_VINE,TEX_VINE,TEX_VINE,TEX_VINE,TEX_VINE,TEX_VINE},
    [TYPE_STEEL]={TEX_STEEL,TEX_STEEL,TEX_STEEL,TEX_STEEL,TEX_STEEL,TEX_STEEL},
    [TYPE_GLASS]={TEX_GLASS,TEX_GLASS,TEX_GLASS,TEX_GLASS,TEX_GLASS,TEX_GLASS},
    [TYPE_GRADIENT]={TEX_GRADIENT,TEX_GRADIENT,TEX_GRADIENT,TEX_GRADIENT,TEX_GRADIENT,TEX_GRADIENT},
    [TYPE_SHINGLE]={TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE,TEX_SHINGLE},
    [TYPE_BTGRASS]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_GRASS_TOP},
    [TYPE_BTDARKSTONE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BEDROCK},
    [TYPE_BTSTONE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_STONE},
    [TYPE_BTDIRT]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_DIRT},
    [TYPE_BTSAND]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_SAND},
    [TYPE_BTTNT]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_TNT_SIDE},
    [TYPE_BTWOOD]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_WOOD},
    [TYPE_BTSHINGLE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_SHINGLE},
    [TYPE_BTGLASS]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_CLOUD},
    [TYPE_BTGRADIENT]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_GRADIENT},
    [TYPE_BTTREE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_TREE_SIDE},
    [TYPE_BTLEAVES]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_LEAVES},
    [TYPE_BTBRICK]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BRICK},
    [TYPE_BTCOBBLESTONE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_COBBLESTONE},
    [TYPE_BTVINES]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_VINE},
    [TYPE_BTLADDER]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_LADDER},
    [TYPE_BTICE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_ICE},
    [TYPE_BTCRYSTAL]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_CRYSTAL},
    [TYPE_BTTRAMPOLINE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_TRAMPOLINE},
    [TYPE_BTCLOUD]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_CLOUD},
    [TYPE_BTSTONESIDE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_STONE},
    [TYPE_BTWOODSIDE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_WOOD},
    [TYPE_BTICESIDE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_ICE},
    [TYPE_BTSHINGLESIDE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_SHINGLE},
    [TYPE_BTFENCE]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_CLOUD},
    [TYPE_BTWATER]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_DIRT},
    [TYPE_BTLAVA]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_DIRT},
    [TYPE_BTFIREWORK]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_FIREWORK},
    [TYPE_BTLIGHTBOX]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_LIGHTBOX},
    [TYPE_BTSTEEL]={TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_BLOCKTNT,TEX_STEEL},
	
};
