#include "figures.h"
#include <cmath>

figures::figures(QPoint c, int s, int m)
{
    Is_Going_Up = true;
    center = c;
    side = s;
    Move_center = m;
}

void figures::move(QPainter *painter)
{
    if (center.y() - side <= 0)
        Is_Going_Up = false;
    else if (center.y() + side >= 727)
        Is_Going_Up = true;

    if (Is_Going_Up)
        center.ry()=center.y()-Move_center;
    else
        center.ry()=center.y()+Move_center;

    draw(painter);
}

void square::draw(QPainter *painter)
{
    painter->drawLine(center.x()+side,center.y()+side,center.x()+side,center.y()-side);
    painter->drawLine(center.x()+side,center.y()-side,center.x()-side,center.y()-side);
    painter->drawLine(center.x()-side,center.y()-side,center.x()-side,center.y()+side);
    painter->drawLine(center.x()-side,center.y()+side,center.x()+side,center.y()+side);
}

void hexagon::draw(QPainter *painter)
{
    painter->drawLine(round(center.x()-side/2),round(center.y()-sqrt(3)*side/2),center.x()-side,center.y());
    painter->drawLine(center.x()-side,center.y(),round(center.x()-side/2),round(center.y()+sqrt(3)*side/2));
    painter->drawLine(round(center.x()-side/2),round(center.y()+sqrt(3)*side/2),round(center.x()+side/2),round(center.y()+sqrt(3)*side/2));
    painter->drawLine(round(center.x()+side/2),round(center.y()+sqrt(3)*side/2),center.x()+side,center.y());
    painter->drawLine(center.x()+side,center.y(),round(center.x()+side/2),round(center.y()-sqrt(3)*side/2));
    painter->drawLine(round(center.x()+side/2),round(center.y()-sqrt(3)*side/2),round(center.x()-side/2),round(center.y()-sqrt(3)*side/2));
}

void octagon::draw(QPainter *painter)
{
    int r=round(sqrt((1+sqrt(2))/(1+sqrt(2)-1))*side);

    painter->drawLine(center.x()+r,center.y(),round(center.x()+r/sqrt(2)),round(center.y()-r/sqrt(2)));
    painter->drawLine(round(center.x()+r/sqrt(2)),round(center.y()-r/sqrt(2)),center.x(),center.y()-r);
    painter->drawLine(center.x(),center.y()-r,round(center.x()-r/sqrt(2)),round(center.y()-r/sqrt(2)));
    painter->drawLine(round(center.x()-r/sqrt(2)),round(center.y()-r/sqrt(2)),center.x()-r,center.y());
    painter->drawLine(center.x()-r,center.y(),round(center.x()-r/sqrt(2)),round(center.y()+r/sqrt(2)));
    painter->drawLine(round(center.x()-r/sqrt(2)),round(center.y()+r/sqrt(2)),center.x(),center.y()+r);
    painter->drawLine(center.x(),center.y()+r,round(center.x()+r/sqrt(2)),round(center.y()+r/sqrt(2)));
    painter->drawLine(round(center.x()+r/sqrt(2)),round(center.y()+r/sqrt(2)),center.x()+r,center.y());
}

void  octagon::move(QPainter *painter)
{
    int r=round(sqrt((1+sqrt(2))/(1+sqrt(2)-1))*side);

    if (center.y() - r < 0)
        Is_Going_Up = false;
    else if (center.y() + r > 727)
        Is_Going_Up = true;

    if (Is_Going_Up)
        center.ry()=center.y()-Move_center;
    else
        center.ry()=center.y()+Move_center;

    draw(painter);
}
