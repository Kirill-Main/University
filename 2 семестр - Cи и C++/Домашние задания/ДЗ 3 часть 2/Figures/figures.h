#ifndef FIGURES_H
#define FIGURES_H

#include <QPoint>
#include <QPainter>
#include <cmath>

class figures
{
protected:
    QPoint p,center,pa,pb;
    int a, R, len;
    double alpha;
    bool Go_right;
public:
    figures(int x,int y,int a1,int r1,int m):p(x, y), center(x, y - a1), Go_right(true)
    {
        len = m;
        alpha = 1.0/m;
        a = a1;
        R = r1;
        pa.setX(p.x() - round(a/2)); pa.setY(p.y() + round(a/2));
        pb.setX(p.x() + round(a/2)); pb.setY(p.y() + round(a/2));
    }
    void move(QPainter *painter);
    virtual void draw(QPainter *painter) = 0;
};

class circle:public figures
{
public:
    circle(int x,int y,int a1,int r1,int m): figures(x, y, a1, r1, m) {};
    void draw(QPainter *painter);
};

class triangle:public figures
{
public:
    triangle(int x,int y,int a1,int r1,int m): figures(x, y, a1, r1, m) {};
    void draw(QPainter *painter);
};

class kite:public figures
{
private:
    QPoint pc;
public:
    void move(QPainter *painter);
    kite(int x,int y,int a1,int r1,int m):figures(x, y, a1, r1, m)
    {
        pa.setX(p.x() - round(a/2)); pa.setY(p.y() + round(a/100));
        pb.setX(p.x() + round(a/2)); pb.setY(p.y() + round(a/100));
        pc.setX(center.x());
        pc.setY(round(center.y() + 3*a));
    }
    void draw(QPainter *painter);
};

#endif // FIGURES_H
