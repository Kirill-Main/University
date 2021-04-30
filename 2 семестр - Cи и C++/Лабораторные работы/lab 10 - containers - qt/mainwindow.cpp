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

        float k = atof(str.c_str());
        if (k||(str.length()==1 && str[0]=='0')) e=new real(k);
        else e=new string(str);

        list->add(e);

    }
    else if (ui->radioButton_delete->isChecked())
    {
        ui->label_show->clear();
        QString string1 = ui->textEdit->toPlainText().trimmed();
        ui->textEdit->clear();

        std::string str= string1.toStdString();

        if (!str.length()) exit(0);

        float k = atof(str.c_str());
        if (k||(str.length()==1 && str[0]=='0'))
        {
            if (list->delete_number(k))
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
        else
        {
            if (list->delete_string(str))
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

    }
    else if (ui->radioButton_print->isChecked())
    {
        ui->textEdit->clear();
        ui->label_show->clear();

        std::string str = list->get_elements();
        std::string max = list->find_max_number();
        std::string min = list->find_short_string();
        str += max;
        str += min;

        ui->label_show->setText(str.c_str());

    }

}
