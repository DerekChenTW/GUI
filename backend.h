#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

class backend : public QObject
{
    Q_OBJECT

    //Q_PROPERTY(QString getAdress READ getAdress WRITE startPictureGenerated NOTIFY pictureGenerated)


public:
    backend();

    QString getAdress();
    //void startPictureGenerated(const QString &adress);

signals:
    void pictureGenerated();

public slots:
    void startPictureGenerated();

private:
    QString m_adress;
};

#endif // BACKEND_H
