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
    heapShapeObjList->next = 0;
    return heapShapeObjList;
}

EmbShapeObjectList* embShapeObjectList_add(EmbShapeObjectList* pointer, EmbShapeObject* data)
{
    if(!pointer) { embLog_error("emb-shape.c embShapeObjectList_add(), pointer argument is null\n"); return 0; }
    pointer->next = (EmbShapeObjectList*)malloc(sizeof(EmbShapeObjectList));
    if(!pointer->next) { embLog_error("emb-shape.c embShapeObjectList_add(), cannot allocate memory for pointer->next\n"); return 0; }
    pointer = pointer->next;
    pointer->shapeObj = data;
    pointer->next = 0;
    return pointer;
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
        nextPointer = tempPointer->next;
        embShapeObject_free(tempPointer->shapeObj);
        tempPointer->shapeObj = 0;
        free(tempPointer);
        tempPointer = nextPointer;
    }
    pointer = 0;
}

/* kate: bom off; indent-mode cstyle; indent-width 4; replace-trailing-space-save on; */

