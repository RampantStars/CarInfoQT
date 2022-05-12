#include "carlist.h"
#include <QDebug>
#include <QMessageBox>
#include <QWidget>
#include <QApplication>

CarList::CarList(QObject* parent):QAbstractListModel(parent)
{
    add("BMW", "X5 xDrive40i", "340", "450", "5,5");
    add("Honda", "Brio", "245", "221", "8,3");
    add("Toyota", "Highlander", "89", "110", "10");
}

CarList::~CarList()
{

}

int CarList::rowCount(const QModelIndex&) const //число элементов в data
{
    return listOfCars.size();
}


QVariant CarList::data(const QModelIndex &index, int role) const //возвращает данные элемента
{
    if (index.row() < 0 || index.row() >= listOfCars.size())
            return QVariant();
      {
        switch (role) {
                case brand:
                    return QVariant(listOfCars.at(index.row()).getBrand());
                case model:
                    return QVariant(listOfCars.at(index.row()).getModel());
                case horsepower:
                    return QVariant(listOfCars.at(index.row()).getHorsepower());
                case maxTorque:
                    return QVariant(listOfCars.at(index.row()).getMaxTorque());
                case accelerationTime:
                    return QVariant(listOfCars.at(index.row()).getAccelerationTime());

                default:
                    return QVariant();
            }

    }
}

QHash<int, QByteArray> CarList::roleNames() const //возвращает список ролей, доступных в делегате
{
    QHash<int, QByteArray> roles; //элементы произвольно упорядочиваются + происходит оч быстрый поиск значения, связанного с ключом
    roles[brand] = "brandOfCar";
    roles[model] = "modelOfCar";
    roles[horsepower] = "horsepowerOfCar";
    roles[maxTorque] = "maxTorqueOfCar";
    roles[accelerationTime] = "accelerationTimeOfCar";
       return roles;
}

void CarList::add(const QString& brandCar, const QString& modelCar, const QString& horsepowerCar, const QString& maxTorqueCar, const QString& accelerationTimeCar){
     Car car;
     car.setBrand(brandCar);
     car.setModel(modelCar);
     car.setHorsepower(horsepowerCar);
     car.setMaxTorque(maxTorqueCar);
     car.setAccelerationTime(accelerationTimeCar);

    beginInsertRows(QModelIndex(),listOfCars.size(),listOfCars.size()); //издаст нужные сигналы о том что готовится добавление элементов
    listOfCars.append(car);  //добавление в конец списка
    endInsertRows(); //издаёт сигнал о том что в модель добавились элементы
}

QAbstractListModel* CarList::getModel()
{
    return this;
}

void CarList::del(const int index)
{

     if (index >= 0 && index < listOfCars.size())
     {

    // сообщение модели о процессе удаления данных
        beginRemoveRows(QModelIndex(), index, index);
        listOfCars.removeAt(index);
              endRemoveRows();
     }
     //else qDebug() << "Error index";

}

QString CarList::count(const QString& textSelArea){ //считаем речки, полощадь бассейна которых больше указанного числа
    int count = 0;
    for(int i = 0; i < listOfCars.size(); i++)
        if(listOfCars[i].getHorsepower().toInt() < textSelArea.toInt())
            count++;
    QString c = QString::number(count);
    return c;
}


void CarList::edit(const QString& brandCar, const QString& modelCar, const QString& horsepowerCar, const QString& maxTorqueCar, const QString& accelerationTimeCar, const int index) {
     if(index >= 0 && index < listOfCars.size() )
     {
        auto& currentCar = listOfCars[index];
        if (currentCar.getBrand().compare(brandCar)!=0 || currentCar.getModel() != modelCar || currentCar.getHorsepower() != horsepowerCar
                || currentCar.getMaxTorque() != maxTorqueCar || currentCar.getAccelerationTime() != accelerationTimeCar)
        {
            currentCar.setBrand(brandCar);
            currentCar.setModel(modelCar);
            currentCar.setHorsepower(horsepowerCar);
            currentCar.setMaxTorque(maxTorqueCar);
            currentCar.setAccelerationTime(accelerationTimeCar);

            auto modelIndex = createIndex(index, 0); //создавать индексы моделей для использования другими компонентами
            emit dataChanged(modelIndex, modelIndex); //выдается всякий раз, когда изменяются элементы данных, предоставляемые моделью
            //qDebug() << listOfRivers[index].getArea();
        }

     }
     else qDebug() << "Error index";
}
