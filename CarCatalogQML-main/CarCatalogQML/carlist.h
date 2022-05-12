#ifndef CARLIST_H
#define CARLIST_H

#include <QAbstractListModel>
#include <QVariant>
#include <QList>
#include <QModelIndex>
#include <QItemSelectionModel>
#include "car.h"

class CarList : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(QAbstractListModel* carModel READ getModel CONSTANT)  /* первый параметр - тип свойства (property)
                                                                     второй параметр - имя свойства, по которому будем обращаться к реальной модели в qml-файле
                                                                     третий параметр - метод С++ для получения значения свойства (получим саму модель)
                                                                     CONSTANT - qml получит свойство однократно, и в процессе работы это свойство изменяться не будет */
private:
    QList<Car> listOfCars; // непосредственно данные
    QAbstractListModel *getModel();

public:
    CarList(QObject *parent = nullptr);
    ~CarList() override;

    // количество колонок
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;

     // возвращение данных модели по указанному индексу и роли
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const override;

    enum ResentRoles {
            brand = Qt::DisplayRole,
            model = Qt::DisplayRole + 1,
            horsepower = Qt::DisplayRole + 2,
            maxTorque = Qt::DisplayRole + 3,
            accelerationTime = Qt::DisplayRole + 4
       };

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void add(const QString& brandCar, const QString& modelCar, const QString& horsepowerCar, const QString& maxTorqueCar, const QString& accelerationTimeCar);  // макрос указывает, что к методу можно обратиться из QML
    Q_INVOKABLE void del(const int index);
    Q_INVOKABLE QString count(const QString& textSelArea);
    Q_INVOKABLE void edit(const QString& brandCar, const QString& modelCar, const QString& horsepowerCar, const QString& maxTorqueCar, const QString& accelerationTimeCar, const int index);
};


#endif // CARLIST_H
