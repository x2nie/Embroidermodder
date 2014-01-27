#include "emb-shape.h"
#include "emb-logging.h"
#include <stdlib.h>

/**************************************************/
/* EmbShapeObject                              */
/**************************************************/

EmbShapeObject* embShapeObject_create(char kind, EmbPointList* points, EmbColor color, int lineType)
{
    EmbShapeObject* heapShapeObj = (EmbShapeObject*)malloc(sizeof(EmbShapeObject));
    if(!heapShapeObj) { embLog_error("emb-shape.c embShapeObject_create(), cannot allocate memory for heapShapeObj\n"); return 0; }
    heapShapeObj->kind = kind;
    heapShapeObj->pointList = points;
    /* TODO: layer */
    heapShapeObj->color = color;
    heapShapeObj->lineType = lineType;
    return heapShapeObj;
}

void embShapeObject_free(EmbShapeObject* pointer)
{
    embPointList_free(pointer->pointList);
    pointer->pointList = 0;
    free(pointer);
    pointer = 0;
}

/**************************************************/
/* EmbShapeObjectList                           */
/**************************************************/

EmbShapeObjectList* embShapeObjectList_create(EmbShapeObject* data)
{
    EmbShapeObjectList* heapShapeObjList = (EmbShapeObjectList*)malloc(sizeof(EmbShapeObjectList));
    if(!heapShapeObjList) { embLog_error("emb-shape.c embShapeObjectList_create(), cannot allocate memory for heapShapeObjList\n"); return 0; }
    heapShapeObjList->shapeObj = data;
#ifdef EMBSHAPES_PREV
    heapShapeObjList->prev = 0;
#endif
    heapShapeObjList->next = 0;
    return heapShapeObjList;
}

EmbShapeObjectList* embShapeObjectList_add(EmbShapeObjectList* pointer, EmbShapeObject* data)
{
    EmbShapeObjectList* incoming;
    if(!pointer) { embLog_error("emb-shape.c embShapeObjectList_add(), pointer argument is null\n"); return 0; }

    incoming  = (EmbShapeObjectList*)malloc(sizeof(EmbShapeObjectList));
    if(!incoming) { embLog_error("emb-shape.c embShapeObjectList_add(), cannot allocate memory for pointer->next\n"); return 0; }
    pointer->next = incoming;
#ifdef EMBSHAPES_PREV
    incoming->prev = pointer;
#endif
    incoming->shapeObj = data;
    incoming->next = 0;
    return incoming;
}

int embShapeObjectList_count(EmbShapeObjectList* pointer)
{
    int i = 1;
    if(!pointer) return 0;
    while(pointer->next)
    {
        pointer = pointer->next;
        i++;
    }
    return i;
}

int embShapeObjectList_empty(EmbShapeObjectList* pointer)
{
    if(pointer == 0)
        return 1;
    return 0;
}

void embShapeObjectList_free(EmbShapeObjectList* pointer)
{
    EmbShapeObjectList* tempPointer = pointer;
    EmbShapeObjectList* nextPointer = 0;
    while(tempPointer)
    {
#ifdef EMBSHAPES_PREV
        if(tempPointer->prev) {
            tempPointer->prev->next = 0;
            tempPointer->prev = 0;
        }
#endif
        nextPointer = tempPointer->next;
        embShapeObject_free(tempPointer->shapeObj);
        tempPointer->shapeObj = 0;
        free(tempPointer);
        tempPointer = nextPointer;
    }
    pointer = 0;
}

/* kate: bom off; indent-mode cstyle; indent-width 4; replace-trailing-space-save on; */

