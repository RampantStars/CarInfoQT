#ifndef CAR_H
#define CAR_H

//#include <QLabel>
//#include <QObject>
//#include <QTableWidget>
#include "QString"

class Car/*: public QObject*/
{
//    Q_OBJECT

public:
    Car(/*QString ID, QString Brand, QString Model, QString Horsepower, QString MaxTorque,
        QString AccelerationTime, QString ImageSource*/);
    ~Car();
    void setID(QString ID);
    void setBrand(const QString Name);
    void setModel(const QString Name);
    void setHorsepower(const QString Name);
    void setMaxTorque(const QString Name);
    void setAccelerationTime(const QString Name);
//    void setImageSource(QString Name);

    QString getID();
    QString getBrand() const;
    QString getModel() const;
    QString getHorsepower() const;
    QString getMaxTorque() const;
    QString getAccelerationTime() const;
//    QString getImageSource();
//    static QString idCounter;
//    static QStringList getBrands();
//    QTableWidgetItem *picture = new QTableWidgetItem;

private:
    QString id;
    QString brand;
    QString model;
    QString horsepower;
    QString maxTorque;
    QString accelerationTime;
//    QString imageSource;
};

#endif // CAR_H
