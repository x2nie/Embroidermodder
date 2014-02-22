#include "emb-object.h"
#include "emb-logging.h"
#include <stdlib.h>

/**************************************************/
/* EmbObject                              */
/**************************************************/

EmbObject* embObject_create(char kind, EmbPointList* points, EmbColor color, int lineType)
{
    EmbObject* heapObjectObj = (EmbObject*)malloc(sizeof(EmbObject));
    if(!heapObjectObj) { embLog_error("emb-object.c embObject_create(), cannot allocate memory for heapObjectObj\n"); return 0; }
    heapObjectObj->kind = kind;
    heapObjectObj->pointList = points;
    /* TODO: layer */
    heapObjectObj->color = color;
    heapObjectObj->lineType = lineType;
    return heapObjectObj;
}

void embObject_free(EmbObject* pointer)
{
    embPointList_free(pointer->pointList);
    pointer->pointList = 0;
    free(pointer);
    pointer = 0;
}

/**************************************************/
/* EmbObjectList                           */
/**************************************************/

EmbObjectList* embObjectList_create(EmbObject* data)
{
    EmbObjectList* heapObjectObjList = (EmbObjectList*)malloc(sizeof(EmbObjectList));
    if(!heapObjectObjList) { embLog_error("emb-object.c embObjectList_create(), cannot allocate memory for heapObjectObjList\n"); return 0; }
    heapObjectObjList->objectObj = data;
#ifdef EMBOBJECTS_PREV
    heapObjectObjList->prev = 0;
#endif
    heapObjectObjList->next = 0;
    heapObjectObjList->child = 0;
    return heapObjectObjList;
}

EmbObjectList* embObjectList_add(EmbObjectList* pointer, EmbObject* data)
{
    EmbObjectList* incoming;
    if(!pointer) { embLog_error("emb-object.c embObjectList_add(), pointer argument is null\n"); return 0; }

    incoming  = (EmbObjectList*)malloc(sizeof(EmbObjectList));
    if(!incoming) { embLog_error("emb-object.c embObjectList_add(), cannot allocate memory for pointer->next\n"); return 0; }
    pointer->next = incoming;
#ifdef EMBOBJECTS_PREV
    incoming->prev = pointer;
#endif
    incoming->objectObj = data;
    incoming->next = 0;
    incoming->child = 0;
    return incoming;
}

int embObjectList_count(EmbObjectList* pointer)
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

int embObjectList_empty(EmbObjectList* pointer)
{
    if(pointer == 0)
        return 1;
    return 0;
}

void embObjectList_free(EmbObjectList* pointer)
{
    EmbObjectList* tempPointer = pointer;
    EmbObjectList* nextPointer = 0;
    while(tempPointer)
    {
#ifdef EMBOBJECTS_PREV
        if(tempPointer->prev) {
            tempPointer->prev->next = 0;
            tempPointer->prev = 0;
        }
#endif
        nextPointer = tempPointer->next;
        embObject_free(tempPointer->objectObj);
        tempPointer->objectObj = 0;
        free(tempPointer);
        tempPointer = nextPointer;
    }
    pointer = 0;
}

/* kate: bom off; indent-mode cstyle; indent-width 4; replace-trailing-space-save on; */

