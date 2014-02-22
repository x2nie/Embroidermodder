#ifndef EMBOBJECT_H
#define EMBOBJECT_H

#define EMBOBJECTS_PREV

#ifdef __cplusplus
extern "C" {
#endif

#include "emb-color.h"
#include "emb-point.h"
#include "emb-flag.h"

/* path flag codes */
/*#define LINETO             0
#define MOVETO             1
#define BULGETOCONTROL     2
#define BULGETOEND         4
#define ELLIPSETORAD       8
#define ELLIPSETOEND      16
#define CUBICTOCONTROL1   32
#define CUBICTOCONTROL2   64
#define CUBICTOEND       128
#define QUADTOCONTROL    256
#define QUADTOEND        512*/

#define EMBOBJ_MOVE     'M'
#define EMBOBJ_MOVEREL  'm'

typedef struct EmbObjectList_ EmbObjectList_;

/* One EmbObjectList is usually one shape (circle, rectangle, polyline, polygon)
 * But it also may a partial of shape (line, arc, bezier, quadbezier, ...) */
typedef struct EmbObject_
{
    unsigned char kind;
    char unused;

    EmbPointList* pointList;

    /* Properties */
    int lineType;
    EmbColor color;
} EmbObject;

EmbObject* embObject_create(unsigned char kind, EmbPointList* points, EmbColor color, int lineType);
void embObject_free(EmbObject* pointer);


typedef struct EmbObjectList_
{
    EmbObject* objectObj;
#ifdef EMBOBJECTS_PREV
    struct EmbObjectList_* prev;
#endif
    struct EmbObjectList_* next;
    struct EmbObjectList_* child;

} EmbObjectList;

EmbObjectList* embObjectList_create(EmbObject* data);
EmbObjectList* embObjectList_add(EmbObjectList* pointer, EmbObject* data);
int embObjectList_count(EmbObjectList* pointer);
int embObjectList_empty(EmbObjectList* pointer);
void embObjectList_free(EmbObjectList* pointer);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* EMBOBJECT_H */

/* kate: bom off; indent-mode cstyle; indent-width 4; replace-trailing-space-save on; */
