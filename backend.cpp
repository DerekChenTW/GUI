#include "backend.h"
#include <QProcess>

backend::backend()
{

}

void backend::startPictureGenerated()
{
    QProcess process;
    QString scriptFile =  "D://sample//NewFolder//Document//UI-DataVisualization//dataVisualization.py";
    process.execute("Python D://sample//NewFolder//Document//UI-DataVisualization//dataVisualization.py");

    process.start("cd D://sample//NewFolder//Document//UI-DataVisualization//");
    process.start("Python D://sample//NewFolder//Document//UI-DataVisualization//dataVisualization.py");
    process.waitForFinished(10000);
}

QString backend::getAdress()
{
    return m_adress;
}
