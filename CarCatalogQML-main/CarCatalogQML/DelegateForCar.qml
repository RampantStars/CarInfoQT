import QtQuick 6.0
import QtQuick.Controls 6.0  // это версия библиотеки, содержащей Contol (аналоги виджетов) для версии Qt 5.6
import QtQuick.Layouts 6.0

Rectangle {
    id: carItem
    readonly property color evenBackgroundColor: "#E0FFFF"  // цвет для четных пунктов списка E0FFFF
    readonly property color oddBackgroundColor: "#B0C4DE"   // цвет для нечетных пунктов списка B0C4DE
    readonly property color selectedBackgroundColor: "#00FFFF"  // цвет выделенного элемента списка 00FFFF

    property bool isCurrent: carItem.ListView.view.currentIndex === index   // назначено свойство isCurrent истинно для текущего (выделенного) элемента списка
    property bool selected: carItemMouseArea.containsMouse || isCurrent // назначено свойство "быть выделенным",
    //которому присвоено значение "при наведении мыши,
    //или совпадении текущего индекса модели"

    property variant carData: model // свойство для доступа к данным конкретной реки

    width: parent ? parent.width : carList.width
    height: 160

    // состояние текущего элемента (Rectangle)
    states: [
        State {
            when: selected
            // как реагировать, если состояние стало selected
            PropertyChanges { target: carItem;  // для какого элемента должно назначаться свойство при этом состоянии (selected)
                color: isCurrent ? palette.highlight : selectedBackgroundColor  /* какое свойство целевого объекта (Rectangle)
                                                                                                  и какое значение присвоить*/
            }
        },
        State {
            when: !selected
            PropertyChanges { target: carItem;  color: isCurrent ? palette.highlight : index % 2 == 0 ? evenBackgroundColor : oddBackgroundColor }
        } //PropertyChanges позволяет изменять значения свойств элемента при его изменении между состояниями
    ]

    MouseArea {
        id: carItemMouseArea
        anchors.fill: parent //сделать такой же
        hoverEnabled: true //обработка если навели курсор, а не кликнули
        onClicked: { //если кликнули
            carItem.ListView.view.currentIndex = index
            carItem.forceActiveFocus() //фокус на указанный элемент
        }
    }
    Item {
        id: itemOfCars
        width: parent.width
        height: 160
        Column{
            id: t2
            anchors.left: parent.left
            anchors.leftMargin: 10
            width: 240
            anchors.verticalCenter: parent.verticalCenter
            Text {
                id: t1
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Марка:"
                color: "DarkBlue"
                font.pointSize: 12 //размер шрифта
            }
            Text {
                id: textName
                anchors.horizontalCenter: parent.horizontalCenter
                text: brandOfCar
                color: "DarkBlue"
                font.pointSize: 18
                font.bold: true
            }
        }
        Column{
            anchors.left: t2.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            Text {
                text: "Модель:"
                color: "DarkRed"
                font.pointSize: 10
            }
            Text {
                id: textLenght
                text: modelOfCar
                color: "DarkBlue"
                font.pointSize: 12
                font.bold: true
            }
            Text {
                text: "Максимальная мощность:"
                color: "DarkBlue"
                font.pointSize: 10
            }
            Text {
                id: textFlow
                color: "DarkBlue"
                text: horsepowerOfCar
                font.pointSize: 12
                font.bold: true
            }
            Text {
                text: "Максимальный крутящий момент:"
                color: "DarkBlue"
                font.pointSize: 10
            }
            Text {
                id: textRunoff
                text: maxTorqueOfCar
                color: "DarkBlue"
                font.pointSize: 12
                font.bold: true
            }
            Text {
                text: "Время разгона от 0 до 100 км/ч:"
                color: "DarkBlue"
                font.pointSize: 10
            }
            Text {
                id: textArea
                color: "DarkBlue"
                text: accelerationTimeOfCar
                font.pointSize: 12
                font.bold: true
            }
        }

    }
}
