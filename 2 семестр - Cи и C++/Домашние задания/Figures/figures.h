#ifndef Figure_H
#define Figure_H

#include <QPoint>
#include <QPainter>
#include <cmath>

class Figure
{
protected:
    QPoint p,center,pa,pb;
    int a, R, len;
    double alpha;
    bool Go_right;
public:
    Figure(int x,int y,int a1,int r1,int m):p(x, y), center(x, y - a1), Go_right(true)
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

class Circle:public Figure
{
public:
    Circle(int x,int y,int a1,int r1,int m): Figure(x, y, a1, r1, m) {};
    void draw(QPainter *painter);
};

class Kite:public Figure
{
public:
    Kite(int x,int y,int a1,int r1,int m): Figure(x, y, a1, r1, m) {};
    void draw(QPainter *painter);
};

class kite:public Figure
{
private:
    QPoint pc;
public:
    void move(QPainter *painter);
    kite(int x,int y,int a1,int r1,int m):Figure(x, y, a1, r1, m)
    {
        pa.setX(p.x() - round(a/2)); pa.setY(p.y() + round(a/100));
        pb.setX(p.x() + round(a/2)); pb.setY(p.y() + round(a/100));
        pc.setX(center.x());
        pc.setY(round(center.y() + 3*a));
    }
    void draw(QPainter *painter);
};

#endif // Figure_H
