#ifndef EMBSHAPE_H
#define EMBSHAPE_H

/* #define EMBSHAPES_PREV */

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

typedef struct EmbShapeObjectList_ EmbShapeObjectList_;
typedef struct EmbShapeObject_
{
    char kind;

    EmbPointList* pointList;
    /* similar approach :
    double* d;
    int size_d;     */


    /* Properties */
    int lineType;
    EmbColor color;
} EmbShapeObject;

EmbShapeObject* embShapeObject_create(char kind, EmbPointList* points, EmbColor color, int lineType);
void embShapeObject_free(EmbShapeObject* pointer);

typedef struct EmbShapeObjectList_
{
    EmbShapeObject* shapeObj;
#ifdef EMBSHAPES_PREV
    struct EmbShapeObjectList_* prev;
#endif
    struct EmbShapeObjectList_* next;
    struct EmbShapeObjectList_* child;

} EmbShapeObjectList;

EmbShapeObjectList* embShapeObjectList_create(EmbShapeObject* data);
EmbShapeObjectList* embShapeObjectList_add(EmbShapeObjectList* pointer, EmbShapeObject* data);
int embShapeObjectList_count(EmbShapeObjectList* pointer);
int embShapeObjectList_empty(EmbShapeObjectList* pointer);
void embShapeObjectList_free(EmbShapeObjectList* pointer);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* EMBSHAPE_H */

/* kate: bom off; indent-mode cstyle; indent-width 4; replace-trailing-space-save on; */
