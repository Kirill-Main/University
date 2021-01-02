#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <figures.h>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

protected:
    void paintEvent(QPaintEvent *event);

private:
    Ui::MainWindow *ui;
    QTimer *timer;
    circle *c;
    triangle *t;
    kite *k;

private slots:
    void slotTimerAlarm();
};
#endif // MAINWINDOW_H
