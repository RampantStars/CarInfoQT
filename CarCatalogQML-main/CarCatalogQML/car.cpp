#include "car.h"

Car::Car(/*QString ID, QString Brand, QString Model, QString Horsepower, QString MaxTorque,
                 QString AccelerationTime, QString ImageSource, QObject *parent*/)
{
//    id = ID;
//    brand = Brand;
//    model = Model;
//    horsepower = Horsepower;
//    maxTorque = MaxTorque;
//    accelerationTime = AccelerationTime;
//    imageSource = ImageSource;
//    picture->setData(Qt::DecorationRole, QPixmap(QPixmap(imageSource).scaled(50,50,Qt::IgnoreAspectRatio)));
}

void Car::setID(QString value)
{
    id = value;
}
void Car::setBrand(const QString value)
{
    brand = value;
}
void Car::setModel(const QString value)
{
    model = value;
}
void Car::setHorsepower(const QString value)
{
    horsepower = value;
}
void Car::setMaxTorque(const QString value)
{
    maxTorque = value;
}
void Car::setAccelerationTime(const QString value)
{
    accelerationTime = value;
}

QString Car::getID()
{
    return id;
}
QString Car::getBrand() const
{
    return brand;
}
QString Car::getModel() const
{
    return model;
}
QString Car::getHorsepower() const
{
    return horsepower;
}
QString Car::getMaxTorque() const
{
    return maxTorque;
}
QString Car::getAccelerationTime() const
{
    return accelerationTime;
}

Car::~Car()
{
}
