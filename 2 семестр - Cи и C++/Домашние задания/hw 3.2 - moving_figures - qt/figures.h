#ifndef FIGURES_H
#define FIGURES_H

#include <QPoint>
#include <QPainter>

class figures
{
protected:
    int Move_center, side;
    QPoint center;
    bool Is_Going_Up;

public:
    figures(QPoint c, int s, int m);
    void move(QPainter *painter);
    virtual void draw(QPainter *painter)=0;
};

class square:public figures
{
public:
    square(QPoint c, int s, int m): figures(c, s, m) {};
    void draw(QPainter *painter);
};

class hexagon:public figures
{
public:
    hexagon(QPoint c, int s, int m): figures(c, s, m) {};
    void draw(QPainter *painter);
};

class octagon:public figures
{
public:
    void move(QPainter *painter);
    octagon(QPoint c, int s, int m): figures(c, s, m) {};
    void draw(QPainter *painter);
};

#endif // FIGURES_H
