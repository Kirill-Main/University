#include "figures.h"

void figures::move(QPainter *painter)
{
    if ((pa.x() - center.x() <= len) && Go_right)
    {
        pa.setX(round((pa.x() - center.x())*cos(alpha) + (pa.y() - center.y()) * sin(alpha) + center.x()));
        pa.setY(round((pa.y() - center.y())*cos(alpha) - (pa.x() - center.x()) * sin(alpha) + center.y()));

        pb.setX(round((pb.x() - center.x())*cos(alpha) + (pb.y() - center.y()) * sin(alpha) + center.x()));
        pb.setY(round((pb.y() - center.y())*cos(alpha) - (pb.x() - center.x()) * sin(alpha) + center.y()));
    }
    else
    {
        if (alpha > 0) alpha = 0 - alpha;
        Go_right = false;
        pa.setX(round((pa.x() - center.x())*cos(alpha) + (pa.y() - center.y()) * sin(alpha) + center.x()));
        pa.setY(round((pa.y() - center.y())*cos(alpha) - (pa.x() - center.x()) * sin(alpha) + center.y()));

        pb.setX(round((pb.x() - center.x())*cos(alpha) + (pb.y() - center.y()) * sin(alpha) + center.x()));
        pb.setY(round((pb.y() - center.y())*cos(alpha) - (pb.x() - center.x()) * sin(alpha) + center.y()));

        if (center.x() - pb.x() > len)
        {
          Go_right = true;
          alpha = 0 - alpha;
        }
    }

    draw(painter);
}

void circle::draw(QPainter *painter)
{
    painter->drawEllipse(pa.x(), pa.y() - a, a, a);
}

void triangle::draw(QPainter *painter)
{
    painter->drawLine(pa.x(), pa.y(), pb.x(), pb.y());
    painter->drawLine(pb.x(), pb.y(), center.x(), center.y());
    painter->drawLine(center.x(), center.y(), pa.x(), pa.y());
}

void kite::draw(QPainter *painter)
{
    painter->drawLine(pa.x(), pa.y(), pb.x(), pb.y());
    painter->drawLine(pb.x(), pb.y(), center.x(), center.y());
    painter->drawLine(center.x(), center.y(), pa.x(), pa.y());
    painter->drawLine(pa.x(), pa.y(), pc.x(), pc.y());
    painter->drawLine(pc.x(), pc.y(), pb.x(), pb.y());
    painter->drawLine(center.x(), center.y(), pc.x(), pc.y());
}

void  kite::move(QPainter *painter)
{
    if ((pa.x() - center.x() <= len) && Go_right)
    {
        pa.setX(round((pa.x() - center.x())*cos(alpha) + (pa.y() - center.y()) * sin(alpha) + center.x()));
        pa.setY(round((pa.y() - center.y())*cos(alpha) - (pa.x() - center.x()) * sin(alpha) + center.y()));

        pb.setX(round((pb.x() - center.x())*cos(alpha) + (pb.y() - center.y()) * sin(alpha) + center.x()));
        pb.setY(round((pb.y() - center.y())*cos(alpha) - (pb.x() - center.x()) * sin(alpha) + center.y()));

        pc.setX(round((pc.x() - center.x())*cos(alpha) + (pc.y() - center.y()) * sin(alpha) + center.x()));
        pc.setY(round((pc.y() - center.y())*cos(alpha) - (pc.x() - center.x()) * sin(alpha) + center.y()));
    }
    else
    {
        if (alpha > 0) alpha = 0 - alpha;
        Go_right = false;
        pa.setX(round((pa.x() - center.x())*cos(alpha) + (pa.y() - center.y()) * sin(alpha) + center.x()));
        pa.setY(round((pa.y() - center.y())*cos(alpha) - (pa.x() - center.x()) * sin(alpha) + center.y()));

        pb.setX(round((pb.x() - center.x())*cos(alpha) + (pb.y() - center.y()) * sin(alpha) + center.x()));
        pb.setY(round((pb.y() - center.y())*cos(alpha) - (pb.x() - center.x()) * sin(alpha) + center.y()));

        pc.setX(round((pc.x() - center.x())*cos(alpha) + (pc.y() - center.y()) * sin(alpha) + center.x()));
        pc.setY(round((pc.y() - center.y())*cos(alpha) - (pc.x() - center.x()) * sin(alpha) + center.y()));

        if (center.x() - pb.x() > len)
        {
          Go_right = true;
          alpha = 0 - alpha;
        }
    }

    draw(painter);
}
