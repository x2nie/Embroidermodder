/*! @file emb-pattern.h */
#ifndef EMB_PATTERN_H
#define EMB_PATTERN_H

/* Disable warnings about unsafe use of fopen, fseek etc */
#ifndef __GNUC__
#pragma warning(disable: 4996)
#endif

#ifdef __cplusplus
extern "C" {
#endif

#include "emb-object.h"
#include "emb-arc.h"
#include "emb-circle.h"
#include "emb-ellipse.h"
#include "emb-hoop.h"
#include "emb-line.h"
#include "emb-path.h"
#include "emb-point.h"
#include "emb-polygon.h"
#include "emb-polyline.h"
#include "emb-rect.h"
#include "emb-settings.h"
#include "emb-spline.h"
#include "emb-stitch.h"
#include "emb-thread.h"

typedef struct EmbPattern_
{
    EmbSettings settings;
    EmbHoop hoop;
    EmbStitchList* stitchList;
    EmbThreadList* threadList;

    EmbObjectList* objectObjList;

    EmbArcObjectList* arcObjList;
    EmbCircleObjectList* circleObjList;
    EmbEllipseObjectList* ellipseObjList;
    EmbLineObjectList* lineObjList;
    EmbPathObjectList* pathObjList;
    EmbPointObjectList* pointObjList;
    EmbPolygonObjectList* polygonObjList;
    EmbPolylineObjectList* polylineObjList;
    EmbRectObjectList* rectObjList;
    EmbSplineObjectList* splineObjList;

    EmbStitchList* lastStitch;
    EmbThreadList* lastThread;

    EmbObjectList* lastObjectObj;

    EmbArcObjectList* lastArcObj;
    EmbCircleObjectList* lastCircleObj;
    EmbEllipseObjectList* lastEllipseObj;
    EmbLineObjectList* lastLineObj;
    EmbPathObjectList* lastPathObj;
    EmbPointObjectList* lastPointObj;
    EmbPolygonObjectList* lastPolygonObj;
    EmbPolylineObjectList* lastPolylineObj;
    EmbRectObjectList* lastRectObj;
    EmbSplineObjectList* lastSplineObj;

    int currentColorIndex;
    double lastX;
    double lastY;
} EmbPattern;

EmbPattern* embPattern_create(void);
void embPattern_hideStitchesOverLength(EmbPattern* p, int length);
void embPattern_fixColorCount(EmbPattern* p);
int embPattern_addThread(EmbPattern* p, EmbThread thread);
void embPattern_addStitchAbs(EmbPattern* p, double x, double y, int flags, int isAutoColorIndex);
void embPattern_addStitchRel(EmbPattern* p, double dx, double dy, int flags, int isAutoColorIndex);
void embPattern_changeColor(EmbPattern* p, int index);
void embPattern_free(EmbPattern* p);
void embPattern_scale(EmbPattern* p, double scale);
EmbRect embPattern_calcBoundingBox(EmbPattern* p);
void embPattern_flipHorizontal(EmbPattern* p);
void embPattern_flipVertical(EmbPattern* p);
void embPattern_flip(EmbPattern* p, int horz, int vert);
void embPattern_correctForMaxStitchLength(EmbPattern* p, double maxStitchLength, double maxJumpLength);
void embPattern_center(EmbPattern* p);
void embPattern_loadExternalColorFile(EmbPattern* p, const char* fileName);

void embPattern_addObject(EmbPattern* p, EmbObject* obj);
void embPattern_addObjectList(EmbPattern* p, EmbObjectList* pointer);

void embPattern_addCircleObjectAbs(EmbPattern* p, double cx, double cy, double r);
void embPattern_addEllipseObjectAbs(EmbPattern* p, double cx, double cy, double rx, double ry); /* TODO: ellipse rotation */
void embPattern_addLineObjectAbs(EmbPattern* p, double x1, double y1, double x2, double y2);
void embPattern_addPathObjectAbs(EmbPattern* p, EmbPathObject* obj);
void embPattern_addPointObjectAbs(EmbPattern* p, double x, double y);
void embPattern_addPolygonObjectAbs(EmbPattern* p, EmbPolygonObject* obj);
void embPattern_addPolylineObjectAbs(EmbPattern* p, EmbPolylineObject* obj);
void embPattern_addRectObjectAbs(EmbPattern* p, double x, double y, double w, double h);

void embPattern_copyStitchListToPolylines(EmbPattern* pattern);
void embPattern_copyPolylinesToStitchList(EmbPattern* pattern);
void embPattern_moveStitchListToPolylines(EmbPattern* pattern);
void embPattern_movePolylinesToStitchList(EmbPattern* pattern);

int embPattern_read(EmbPattern* pattern, const char* fileName);
int embPattern_write(EmbPattern* pattern, const char* fileName);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* EMB_PATTERN_H */

/* kate: bom off; indent-mode cstyle; indent-width 4; replace-trailing-space-save on; */
