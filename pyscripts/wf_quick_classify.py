
from PyQt4 import QtGui , QtCore 

class FenLei(QtGui.QWidget):
   
    def __init__(self):
        super(FenLei,self).__init__()
        self.current_type='Off'
        self.initUI()
        
    def initUI(self):
        self.setWindowTitle("WF Quick Classify Tool")
        self.resize(200,40)
        tarr = ['Off','Undefined','Bare',\
            'Builtup','Farm','Forest','Grass','Water']
        hbox = QtGui.QHBoxLayout()
        for t1 in tarr:
            button1 = QtGui.QRadioButton(t1)
            hbox.addWidget(button1)
            self.connect(button1, QtCore.SIGNAL('clicked()'),\
            self.buttonClicked)
        self.setLayout(hbox)
        layer = iface.activeLayer()
        iface.mapCanvas().selectionChanged.connect(self.onFeatureSelected)
        
    def buttonClicked(self):
        sender = self.sender()
        type = sender.text()
        self.current_type = type 
        if self.current_type != 'Off':
            layer = iface.activeLayer()
            num = layer.selectedFeatureCount()
            features = layer.selectedFeatures()
            for featureOne in features :
                attr0 = featureOne.attribute('Class_name')
                indexOfClassName = featureOne.fieldNameIndex('Class_name')
                layer.changeAttributeValue(featureOne.id(), indexOfClassName, self.current_type)
            print 'set ',num,' features ->' , type
        
    def onFeatureSelected(self):
        print 'feature selected->',self.current_type 
        if self.current_type != 'Off':
            layer = iface.activeLayer()
            num = layer.selectedFeatureCount()
            features = layer.selectedFeatures()
            for featureOne in features :
                attr0 = featureOne.attribute('Class_name')
                indexOfClassName = featureOne.fieldNameIndex('Class_name')
                layer.changeAttributeValue(featureOne.id(), indexOfClassName, self.current_type)
            print 'set ',num,' features ->' , type
            
fenlei1 = FenLei()
fenlei1.show() 