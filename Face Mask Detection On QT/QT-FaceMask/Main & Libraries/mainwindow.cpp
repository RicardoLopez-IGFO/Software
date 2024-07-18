#include "mainwindow.h"
#include "ui_mainwindow.h"
#include<opencv2/core/core.hpp>
#include<opencv2/ml/ml.hpp>
#include<opencv/cv.h>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/video/background_segm.hpp>
#include<opencv2/videoio.hpp>
#include<opencv2/imgcodecs.hpp>
#include<QDebug> //Similar a la funcion cout
#include<opencv2/objdetect.hpp>
#include<QTimer>
#include <opencv2/core/types.hpp>
#include <opencv2/highgui/highgui.hpp>
#include<QMouseEvent>
#include<QFileDialog>
using namespace cv;
CascadeClassifier deteccionCaras;
CascadeClassifier deteccionBocas;
CascadeClassifier deteccionNariz;

VideoCapture camara(0); int contador = 0;
//VideoCapture camara("http://192.168.100.111:8080/video");

//Paso · 1 - Declarar las variables donde se guardaran las imagenes
Mat imagen1,imagen_contenedor,imagen_contenedor_chica;
Mat imagenFija, imagenNueva, imagen_gris, imagen_gris2, imagen_hsv;
Mat imagen1_chica, imagen2_chica;
Mat imagen_resultado(640,360, CV_8UC3, Scalar(255,255,255));
Mat imagen_blanca(640,360, CV_8UC3, Scalar(255,255,255));
Mat imagen_error(640,360, CV_8UC3, Scalar(0,0,255));
Mat imagen_Noerror(640,360, CV_8UC3, Scalar(0,255,0));
Mat imagen_recorte(640,360, CV_8UC3, Scalar(255,255,255));

//Variables para determinar la region de interes
Point puntoOrigen;
Size  tamanoROI;


void MainWindow::funcionCronometro(){
    contador++;
    ui->lcdNumber->display(contador);

    //Mostrar la imagen de la camara en una etiqueta (label) de qt.

        //Paso · 1- Determinar que imagen vamos a procesar
        if(ui->checkBox->isChecked()){
            //Procesaremos la imagen de la camara
            camara >> imagen1;
        }
        else{
            //Procesaremos la imagen fija
            imagenFija = imread("../Imagen1.jpg");
            if(!imagenFija.empty()){
                imagenFija.copyTo(imagen1);
            }
            else{
                imagen_error.copyTo(imagen1);
            }

        }
        if(!imagen1.empty()){
            //Realizamos el procesamiento y deteccionMat imagen_chica;

            cv::resize(imagen1, imagen1_chica, Size(640,360),0,0,INTER_LINEAR);
            cv::resize(imagen1, imagen2_chica, Size(640,360),0,0,INTER_LINEAR);
            cvtColor(imagen2_chica, imagen_gris2, CV_BGR2GRAY);
            cvtColor(imagen1_chica, imagen_gris, CV_BGR2GRAY);
            cvtColor(imagen2_chica, imagen_hsv, CV_BGR2HSV);

            equalizeHist(imagen_gris, imagen_gris);
            //Deteccion del objeto 1
            //Primero tendremos que declarar una variable donde se guardaran los objetos encontrados.
            std::vector<Rect> objeto1_Encontrados;
            std::vector<Rect> objeto2_Encontrados;
            std::vector<Rect> objeto3_Encontrados;
            Rect Recorte;

            deteccionCaras.detectMultiScale(imagen_gris, objeto1_Encontrados, 1.1, 2, 0|CASCADE_SCALE_IMAGE, Size(80,80));
            if(!objeto1_Encontrados.empty()){
            //Tercero, verificar que se hayan encontrado objetos y para cada objeto encontrado, dibujar una elipse
            for(int i = 0; i<(int)objeto1_Encontrados.size(); i++){
                //Point centroRostro(X,Y);
                Point centroRostro(objeto1_Encontrados[i].x+objeto1_Encontrados[i].width/2, objeto1_Encontrados[i].y+objeto1_Encontrados[i].height/2);
                QString text=""; ui->label_5->setText(text);

                //Dibjar la elipse sobre el centro anterior
                ellipse(imagen_gris, centroRostro, Size(objeto1_Encontrados[i].width/2, objeto1_Encontrados[i].height/2),0,0,360,Scalar(255,0,0),4,8,0);

                if(ui->checkBox_2->isChecked()){
                        //Recortar imagen
                        Recorte.x=objeto1_Encontrados[i].x;
                        Recorte.y=objeto1_Encontrados[i].y;
                        Recorte.width=objeto1_Encontrados[i].width;
                        Recorte.height=objeto1_Encontrados[i].height;
                        imagen_recorte=imagen1_chica(Recorte);

                        //Detección de Nariz
                        deteccionNariz.detectMultiScale(imagen_recorte,objeto2_Encontrados, 1.1,3,0 |CASCADE_SCALE_IMAGE,Size(60,60));
                        for(int j=0; j<(int)objeto2_Encontrados.size(); j++){

                        Point centroNariz(objeto1_Encontrados[i].x+objeto2_Encontrados[j].x+objeto2_Encontrados[j].width/2,objeto1_Encontrados[i].y+objeto2_Encontrados[j].y+objeto2_Encontrados[j].height/2);
                        putText(imagen1_chica, "Nose", centroNariz, FONT_HERSHEY_PLAIN,1.5,Scalar(0,0,255,255));

                        //Detección de Boca
                        deteccionBocas.detectMultiScale(imagen_recorte,objeto3_Encontrados, 1.1,3,0 |CASCADE_SCALE_IMAGE,Size(50,50));

                        for(int k=0; k<(int)objeto3_Encontrados.size(); k++){

                         Point centroBoca(objeto1_Encontrados[i].x+objeto3_Encontrados[j].x+objeto3_Encontrados[j].width/2,objeto1_Encontrados[i].y+objeto3_Encontrados[j].y+objeto3_Encontrados[j].height/2);
                         putText(imagen1_chica, "Mouth", centroBoca, FONT_HERSHEY_PLAIN,1.5,Scalar(0,0,255,255));
                         imagen_error.copyTo(imagen_resultado);
                        }
                        QString text="¡Sin Cubre Bocas, Favor De Usarlo!"; ui->label_5->setText(text);

                    }
                }else
                {
                 imagen_blanca.copyTo(imagen_recorte); imagen_blanca.copyTo(imagen_resultado);
                 QString text=""; ui->label_5->setText(text);
                }
            }
            }else if(ui->checkBox_2->isChecked()){
                imagen_Noerror.copyTo(imagen_resultado);
                QString text="¡Gracias Por Llevar CubreBocas!"; ui->label_5->setText(text);
            }else{
                imagen_blanca.copyTo(imagen_recorte); imagen_blanca.copyTo(imagen_resultado);
                QString text=""; ui->label_5->setText(text);
            }








            //Paso · 2.5 El multiplexor de colores
            if(ui->radioButton->isChecked()){
                imagen2_chica.copyTo(imagen_contenedor);
            }
            else if(ui->radioButton_2->isChecked()){
                imagen_gris2.copyTo(imagen_contenedor);
            }
            else{
                imagen_hsv.copyTo(imagen_contenedor);
            }


            // #2.2.1 - Multiplexar Tamaños de Imagenes
            if(ui->radioButton_4->isChecked()){
                cv::resize(imagen_contenedor, imagen_contenedor_chica, Size(640,360),0,0, INTER_LINEAR);
            }
            else if(ui->radioButton_5->isChecked()){
                cv::resize(imagen_contenedor, imagen_contenedor_chica, Size(250,350),0,0, INTER_LINEAR);
            }
            else{
                cv::resize(imagen_contenedor, imagen_contenedor_chica, Size(100,100),0,0, INTER_LINEAR);
            }

            QString puntoX = ui->lineEdit_3->text();
            QString puntoY = ui->lineEdit_2->text();
            QString anchoS = ui->lineEdit_4->text();
            QString largoS = ui->lineEdit_5->text();

            puntoOrigen.x = puntoX.toInt();
            puntoOrigen.y = puntoY.toInt();
            tamanoROI.width = anchoS.toInt();
            tamanoROI.height = largoS.toInt();

            Mat imagenNuevaChica;
            Rect region1;
            //Control

            int limite1 = puntoOrigen.x + tamanoROI.width;
            int limite2 = puntoOrigen.y + tamanoROI.height;
            if(puntoOrigen.x >= 0 && puntoOrigen.x <= 639 && puntoOrigen.y >= 0 && puntoOrigen.y <= 359 && limite1 < 639 && limite2 < 359){

                region1.x = puntoOrigen.x;
                region1.y = puntoOrigen.y;
                region1.width = tamanoROI.width;
                region1.height = tamanoROI.height;

                //Crear una imagen nueva a partir de la region de interes
                imagenNueva = imagen2_chica(region1);

                //Control · 2
                if(!imagenNueva.empty()){
                    //Cambiar de tamaño a la nueva imagen
                    cv::resize(imagenNueva, imagenNuevaChica, Size(300,150),0,0,INTER_LINEAR);
                }
            }

            //QImage imagenQT = Mat2QImage(imagen2_gris);
            QImage imagenQT = Mat2QImage(imagen_contenedor_chica);
            QImage imagenQT1 = Mat2QImage(imagen1_chica); //imagen_recorte
            QImage imagenQT2 = Mat2QImage(imagen_resultado);
            QImage imagenQT3 = Mat2QImage(imagenNuevaChica);
            //Paso · 3.2 Convertir la imagen de qt a un mapa de pixeles
            QPixmap imagenMapa = QPixmap::fromImage(imagenQT);
            QPixmap imagenMapa1 = QPixmap::fromImage(imagenQT1);
            QPixmap imagenMapa2 = QPixmap::fromImage(imagenQT2);
            QPixmap imagenMapa3 = QPixmap::fromImage(imagenQT3);

            //Paso · 3.3 Limpiar el contenido de la etiqueta
            ui->label_2->clear();
            ui->label_3->clear();
            ui->label_4->clear();
            ui->label_13->clear();

            //Paso · 3.4 Mostrar el mapa de pixeles en la etiqueta
            ui->label_2->setPixmap(imagenMapa);
            ui->label_3->setPixmap(imagenMapa1);
            ui->label_4->setPixmap(imagenMapa2);
            ui->label_13->setPixmap(imagenMapa3);
        }
        else{
            QImage imagenQT = Mat2QImage(imagen_error);

            //Paso · 3.2 Convertir la imagen de qt a un mapa de pixeles
            QPixmap imagenMapa = QPixmap::fromImage(imagenQT);

            //Paso · 3.3 Limpiar el contenido de la etiqueta
            ui->label_2->clear();

            //Paso · 3.4 Mostrar el mapa de pixeles en la etiqueta
            ui->label_2->setPixmap(imagenMapa);
        }
}

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    //Inicio de la configuraciòn de la ventana

    //Pre-cargar al clasificador
    deteccionCaras.load("../HAAR-CARA-FRONTAL-DEFAULT.xml");
    deteccionBocas.load("../Boca.xml");
    deteccionNariz.load("../nose.xml");

    //Crear una variable para la configuración del cronometro
    QTimer *cronometro = new QTimer(this);

    //Configuración del cronometro
    connect(cronometro, SIGNAL(timeout()), this, SLOT(funcionCronometro()));

    //Iniciar cronometro
    cronometro->start(30);

}


MainWindow::~MainWindow()
{
    //Se borra la ventana
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    QString nombreImagen=ui->lineEdit->text(); QString nombreImagen2=ui->lineEdit->text();
    nombreImagen=nombreImagen + ".jpg";
    nombreImagen2=nombreImagen + ".png";
    if(!imagen_contenedor_chica.empty()){
        imwrite(nombreImagen.toUtf8().constData(),imagen_contenedor_chica);
        imwrite(nombreImagen2.toUtf8().constData(),imagen1_chica);
    }
}
