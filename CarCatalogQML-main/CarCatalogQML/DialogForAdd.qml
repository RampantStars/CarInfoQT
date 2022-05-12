import QtQuick 6.0
import QtQuick.Window 6.0
import QtQuick.Controls 6.0 // это версия библиотеки, содержащей Contol (аналоги виджетов) для версии Qt 5.6
import QtQuick.Layouts 6.0


Window {
    id: root
    modality: Qt.ApplicationModal  // окно объявляется модальным
    title: qsTr("Добавление информации о машине")
    minimumWidth: 400
    maximumWidth: 400
    minimumHeight: 200
    maximumHeight: 200

    GridLayout {
        anchors { left: parent.left; top: parent.top; right: parent.right; bottom: buttonCancel.top; margins: 10 }
        columns: 2

        Label {
            Layout.alignment: Qt.AlignRight  // выравнивание по правой стороне
            text: qsTr("Марка:")
        }
        TextField {
            id: textBrand
            Layout.fillWidth: true
            placeholderText: qsTr("Введите марку") //текст-заполнитель строки редактирования
        }
        Label {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Модель:")
        }
        TextField {
            id: textModel
            Layout.fillWidth: true
            placeholderText: qsTr("Введите модель")
        }
        Label {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Максимальная мощность:")
        }
        TextField {
            id: textHorsepower
            Layout.fillWidth: true
            placeholderText: qsTr("Введите максимальную мощность")
        }
        Label {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Максимальный крутящий момент:")
        }
        TextField {
            id: textMaxTorque
            Layout.fillWidth: true
            placeholderText: qsTr("Введите максимальный крутящий момент")
        }
        Label {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Разгон от 0 до 100 км/ч:")
        }
        TextField {
            id: textAccelerationTime
            Layout.fillWidth: true
            placeholderText: qsTr("Введите разгон от 0 до 100 км/ч")
        }
    }

    Button {
        visible: {textBrand.length>0 && textModel.length>0} //условия отображения кнопки
        anchors { right: buttonCancel.left; verticalCenter: buttonCancel.verticalCenter; rightMargin: 10 }
        text: qsTr("Добавить в список")
        width: 100
        onClicked: {
            root.hide()
            add(textBrand.text, textModel.text, textHorsepower.text, textMaxTorque.text, textAccelerationTime.text)
        }
    }
    Button {
        id: buttonCancel
        anchors { right: parent.right; bottom: parent.bottom; rightMargin: 10; bottomMargin: 10 }
        text: qsTr("Отменить")
        width: 100
        onClicked: {
             root.hide()
        }
    }

    // изменение статуса видимости окна диалога
    onVisibleChanged: {
      if (visible) {
          textBrand.text = ""
          textModel.text = ""
          textHorsepower.text = ""
          textMaxTorque.text = ""
          textAccelerationTime.text = ""
      }
    }
 }
