#ifndef _DRAW_H_
#define _DRAW_H_

#include "helper.h"

bool createBitmap(size_t width, size_t height);
bool saveBitmap(char* filename);
void setPixel(int x, int y, uint8_t color, float fsub);

#endif
