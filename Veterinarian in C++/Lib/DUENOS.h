#ifndef DUEÑOS_INCLUDED
#define DUEÑOS_INCLUDED
#include <iostream>
#include <string.h>
#include <conio.h>
#include <stdlib.h>
#include <fstream>
#include <stdio.h>
#include <ctype.h>
#include "SERIALIZAR.h"


using namespace std;

class Dueno
{
    public:

        void GeneraD(string, string, string);
        void MostrarD();
        void BuscarD(string Codigo);
        void ModificarDT(string Codigo);
        void EliminarD(string Codigo);
        bool VerificarD(string, string);
        void SerializarD();

        string Dueno;
        string Codigo;
        string Telefono;
        string Paciente;

        friend class Pacientes;
        //friend class Dueno;
}D;



void Dueno::GeneraD(string Name, string Pacient, string Code)
{
	int intValor=0; string strRetVal,tmp;  char *myBuff; int cont=0;  bool band1, band2, band3;

	                            Codigo=(Dueno.substr(0,1)+Pacient.substr(0,1));
                                intValor=intValor+((Pacient.length()+Dueno.length())*3);
                                myBuff = new char[100];
                                memset(myBuff,'\0',100);
                                itoa(intValor,myBuff,10);
                                strRetVal = myBuff;
                                delete[] myBuff;
                                Codigo="D"+Codigo+strRetVal;


	fstream archivo("Dueno.txt", ios::in|ios::out);
	if(!archivo.good())
	{                }
	else
	{
		string tmp, tmp2, tmp3, tmp4;
		system("cls");
		while(!archivo.eof())
		{
			getline(archivo, tmp3, '|');
			getline(archivo, tmp, '|');
			getline(archivo, tmp2, '|');
			if(archivo.eof()){    break;    }
			if(tmp.compare(Name)==0 && tmp2.compare(Code)==0)
			{
			    band1=true;
			}
			else if(tmp.compare(Name)==0 && tmp2.compare(Code)!=0)
			{
				Codigo=tmp3;
				getline(archivo, tmp4, '\n');
				Telefono=tmp4;
				band2=true;
			}
			else if((tmp.compare(Name)!=0 && tmp2.compare(Code)==0)||(tmp.compare(Name)!=0 && tmp2.compare(Code)!=0))
			{
				band3=true;
			}
			else
			{
			    getline(archivo, tmp, '\n');
			}
		}
	}
	archivo.close();

    ofstream arc("Dueno.txt",ios::app);
    if(band1==true)
	{

	}
    else if(band2==true)
    {
        arc<<Codigo<<'|'<<Name<<'|'<<Code<<'|'<<Telefono<<endl;
        arc.close();
        system("cls");
	}
	else if(band3=true)
	{
		cout<<"\n\tTelefono:   \t"; getline(cin,Telefono);
		arc<<Codigo<<'|'<<Name<<'|'<<Code<<'|'<<Telefono<<endl;
        arc.close();
        system("cls");
	}
	arc.close();
}


void Dueno::MostrarD()
{
    fstream archivo("Dueno.txt",ios::in|ios::out);
    if(!archivo.good())
    {
        cout<<"\n\t Error Al Abrir El Archivo\n\n";  getch(); system("cls");
    }
    else
    {       string tmp; int i=0; system("cls");
            cout<<endl<<"\tLista De Dueños\n\n";

           while(!archivo.eof())
            {
                i++;
		                                                   getline(archivo,tmp,'|');
                if(archivo.eof()){    break;    }

                cout<<"Codigo:      \t"<<tmp<<endl;        getline(archivo,tmp,'|');
                cout<<"Nombre:      \t"<<tmp<<endl;        getline(archivo,tmp,'|');
                cout<<"Paciente:    \t"<<tmp<<endl;        getline(archivo,tmp,'\n');
                cout<<"Telefono:    \t"<<tmp<<endl;
				cout<<"------------------------------------"<<endl;
            }
            cout<<endl;
    }
    system("pause");
}


void Dueno::BuscarD(string Code)
{

	int band=0;

	fstream archivo("Dueno.txt", ios::in|ios::out);
	if(!archivo.good())
	{
		cout<<"\nError En Archivo\n";
	}
	else
	{
		string tmp;

		while(!archivo.eof())
		{
			getline(archivo, tmp, '|');

			if(archivo.eof()) {break;}

			if(tmp.compare(Code)==0)
			{
			cout<<"Codigo:    \t"<<tmp<<endl;
			getline(archivo, tmp, '|');
			cout<<"Nombre:    \t"<<tmp<<endl;
			getline(archivo, tmp, '|');
			cout<<"Paciente:  \t"<<tmp<<endl;
			getline(archivo, tmp, '\n');
			cout<<"Telefono:  \t"<<tmp<<endl;
			cout<<"-----------------------------"<<endl;
			band=1;
			}
			else
			{
				getline(archivo, tmp, '\n');
			}
		}
		if(band==0)
		{
			cout<<"\nCodigo No encontrado\n";
		}
	}
	system("pause"); system("cls");
}


void Dueno::ModificarDT(string Code)
{
	string tmp,code,nom,phone,paci;
	int cont=0, m, modificar;
    bool band = false;
    char confi;

    fstream archivo("Dueno.txt",ios::in|ios::out);
    fstream res("Background.txt",ios::app);

    if(!archivo.good())
    {
        cout<< "\nError En Archivo\n\n" << endl;   system("pause");    return;
    }
    while (!archivo.eof())
    {
        cont ++;
        getline(archivo,tmp,'|');

        if(archivo.eof()) {    break;    }
        if(tmp!=Code)
        {        res << tmp << '|';
                 getline(archivo, tmp, '|');
                 res << tmp << '|';
                 getline(archivo, tmp, '|');
                 res << tmp << '|';
                 getline(archivo, tmp, '\n');
                 res << tmp << '\n';
        }
        else
        {
		        band = true;
                 cout<<"Codigo:  \t"<<tmp<<endl;    code=tmp;    getline(archivo, tmp, '|');
                 cout<<"Nombre:  \t"<<tmp<<endl;    nom=tmp;     getline(archivo, tmp, '|');
                 cout<<"Paciente:\t"<<tmp<<endl;    paci=tmp;    getline(archivo, tmp, '\n');
                 cout<<"Telefono:\t"<<tmp<<endl;    phone=tmp;

                cout<<"\nIngrese Nuevo Numero Telefonico\n";  fflush(stdin);    getline(cin,phone);
                res << code  << '|';
                res << nom   << '|';
                res << paci  << '|';
                res << phone << '\n';
                cout<<"\nCodigo:  \t"<<code<<endl;
                cout<<"\nNobre:   \t"<<nom<<endl;
                cout<<"\nPaciente:\t"<<paci<<endl;
                cout<<"\nTelefono:\t"<<phone<<endl;
        }
	}

 if (!band)
    {     cout <<"Codigo Inexistente\n";       system("pause");      }
    archivo.close();   res.close();
    cout<< "\n\tConfirme Modificacion\n\n S - (si)\n N - (no)\n\n\n";        fflush(stdin);  cin>>confi;      system("cls");
    if(confi=='s'|| confi=='S'|| confi=='Si'|| confi=='si'|| confi=='SI'|| confi=='sI'|| confi=='i'|| confi=='I')
    {    remove("Dueno.txt");     rename("Background.txt","Dueno.txt");    cout<<"\n\nModificación Hecha"<<endl;  system("pause");  }
    else
    {    remove("Background.txt");   cout<<"\n\nModificacion Cancelada...."<<endl;     system("pause");      }
}


void Dueno::EliminarD(string Code)
{
    int cont=0;
    char confi;
    fstream archivo("Dueno.txt",ios::in|ios::out);
    fstream res("Background.txt",ios::app);
    string tmp;
    bool band = false;
    if(!archivo.good())
    {
        cout<< "Error En Archivo." << endl;
        system("pause");
        return;
    }
    while (!archivo.eof())
    {
        cont ++;
        getline(archivo,tmp,'|');
        if(archivo.eof())
            break;
        if(tmp!=Code)
        {        res << tmp << '|';
                 getline(archivo, tmp, '|');
                 res << tmp << '|';
                 getline(archivo, tmp, '|');
                 res << tmp << '|';
                 getline(archivo, tmp, '\n');
                 res << tmp << '\n';
        }
        else
        {
                 cout<<"\n\n\tCodigo Encontrado\n\n";
                 cout<<"Codigo:   \t"<<tmp<<endl;
                 getline(archivo, tmp, '|');
                 cout<<"Nombre:   \t"<<tmp<<endl;
                 getline(archivo, tmp, '|');
                 cout<<"Paciente: \t"<<tmp<<endl;
                 getline(archivo, tmp, '\n');
                 cout<<"Telefono: \t" << tmp << endl;
                 band = true;
        }
    }
    if (!band)
    {    cout <<"Codigo Inexistente\n";     system("pause");   }
    archivo.close();   res.close();
    cout<< "\n\tConfirme Eliminacion\n\n S - (si)\n N - (no)\n\n\n";    fflush(stdin);    cin>>confi;       system("cls");
    if(confi=='s'|| confi=='S'|| confi=='Si'|| confi=='si'|| confi=='SI'|| confi=='sI'|| confi=='i'|| confi=='I')
    {     remove("Dueno.txt");     rename("Background.txt","Dueno.txt");     }
    else
    {     remove("Background.txt");       }        system("pause");   system("cls");
}




void Dueno::SerializarD()
{
	fstream ac("Serial.txt",ios::in|ios::out);
	ac.close();
	remove("Serial.txt");


	fstream archivo("Dueno.txt",ios::in|ios::out);
    if(!archivo.good())
    {
        cout<<"\n\t Error Al Abrir El Archivo\n\n";  getch(); system("cls");
    }
    else
    {      string tmp;  system("cls");

           while(!archivo.eof())
            {
		                getline(archivo,tmp,'|');    z.GeneraS(tmp);
                if(archivo.eof()){    break;    }

                        getline(archivo,tmp,'|');    z.GeneraS(tmp);
                        getline(archivo,tmp,'|');    z.GeneraS(tmp);
                        getline(archivo,tmp,'\n');   z.GeneraS(tmp);

            }
            cout<<endl;
    }
    system("pause");
}


#endif
