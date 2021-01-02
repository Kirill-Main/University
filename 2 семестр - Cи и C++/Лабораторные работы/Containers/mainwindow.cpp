#include "mainwindow.h"
#include "ui_mainwindow.h"

element *e;

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->radioButton_add->setChecked(true);

    s = new new_spisok();
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    if (ui->radioButton_add->isChecked())
    {
        ui->label_show->clear();
        QString string1 = ui->textEdit->toPlainText().trimmed();
        ui->textEdit->clear();
        std::string str= string1.toStdString();

        if (!str.length()) exit(0);

        int k=atoi(str.c_str());
        if (k||(str.length()==1 && str[0]=='0')) e=new integer(k);
        else e=new string(str);

        s->Add(e);

    }
    else if (ui->radioButton_delete->isChecked())
    {
        ui->label_show->clear();
        QString string1 = ui->textEdit->toPlainText().trimmed();
        ui->textEdit->clear();

        std::string str= string1.toStdString();

        if (!str.length()) exit(0);

        if (s->Delete(str))
        {
            std::string s="Элемент " + str +" удален из множества!";
            ui->label_show->setText(s.c_str());
        }
        else
        {
            std::string s="Элемент " + str +" не найден во множестве!";
            ui->label_show->setText(s.c_str());
        }

    }
    else if (ui->radioButton_find->isChecked())
    {
        ui->label_show->clear();
        QString string1 = ui->textEdit->toPlainText().trimmed();
        ui->textEdit->clear();

        std::string str= string1.toStdString();

        if (!str.length()) exit(0);

        if (s->find(str))
        {
            std::string s="Элемент " + str +" найден во множестве!";
            ui->label_show->setText(s.c_str());
        }
        else
        {
            std::string s="Элемент " + str +" не найден во множестве!";
            ui->label_show->setText(s.c_str());
        }

    }
    else if (ui->radioButton_print->isChecked())
    {
        ui->textEdit->clear();
        ui->label_show->clear();

        std::string str = s->Get_Elements();
        std::string mult = s->multiply_numbers();
        str += mult;

        ui->label_show->setText(str.c_str());

    }

}
