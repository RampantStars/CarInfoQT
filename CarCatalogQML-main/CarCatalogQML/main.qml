import QtQuick 6.0
import QtQuick.Window 6.0
import QtQuick.Controls 6.0// это версия библиотеки, содержащей Contol (аналоги виджетов) для версии Qt 5.6
import QtQuick.Layouts 6.0

Window {
    visible: true
    width: 800
    height: 550
    title: qsTr("Каталог автомобилей")

    // объявляется системная палитра
    SystemPalette {
          id: palette;
          colorGroup: SystemPalette.Active
       }

    Rectangle{
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: buttonAdd.top
        anchors.bottomMargin: 8
        border.color: "SteelBlue"


    ScrollView {
        anchors.fill: parent
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15

        ListView {
            id: carList
            anchors.fill: parent
            model: carModel // назначение модели, данные которой отображаются списком
            delegate: DelegateForCar{}
            clip: true
            activeFocusOnTab: true  // реагирование на перемещение между элементами ввода с помощью Tab
            focus: true  // элемент может получить фокус
        }
    }
    }

    Button {
        id: buttonAdd
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.rightMargin: 8
        anchors.right:buttonEdit.left
        text: "Добавить"
        width: 100
        onClicked: windowAdd.show()
    }

    Button {
        id: buttonEdit
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: buttonDelete.left
        anchors.rightMargin: 8
        text: "Редактировать"
        width: 100
        onClicked: {
            var brandCar = carList.currentItem.carData.brandOfCar
            var modelCar = carList.currentItem.carData.modelOfCar
            var horsepowerCar = carList.currentItem.carData.horsepowerOfCar
            var maxTorqueCar = carList.currentItem.carData.maxTorqueOfCar
            var accelerationTimeCar = carList.currentItem.carData.accelerationTimeOfCar

            windowEdit.execute(brandCar, modelCar, horsepowerCar, maxTorqueCar, accelerationTimeCar, carList.currentIndex)
        }
    }

    Button {
        id: buttonDelete
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right:parent.right
        anchors.rightMargin: 8
        text: "Удалить"
        width: 100
        enabled: carList.currentIndex >= 0
        onClicked: del(carList.currentIndex)
    }

    Label {
        id: labelArea
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 12
        anchors.left: parent.left
        //anchors.right: butAdd.left
        anchors.rightMargin: 8
        anchors.leftMargin: 8
        Layout.alignment: Qt.AlignRight  // выравнивание по правой стороне
        text: qsTr("Введите ограничение на макс. мощность:")
    }
    TextField {
        id: textSelArea
        Layout.fillWidth: true
        placeholderText: qsTr("")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.leftMargin: 8
        anchors.left: labelArea.right
        anchors.rightMargin: 8
    }
    Button {
        id: buttonCount
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        //anchors.right:parent.right
        anchors.left: textSelArea.right
        anchors.leftMargin: 8
        text: "Подсчитать"
        width: 100
        enabled: textSelArea.text != ""
        onClicked: windowAnswer.countCars(textSelArea.text)
    }

    DialogForAnswer {
        id: windowAnswer
    }
    DialogForAdd {
        id: windowAdd
    }
    DialogForEdit {
        id: windowEdit
    }
}
