#ifndef EMPLEADOS_INCLUDED
#define EMPLEADOS_INCLUDED
#include<iostream>
#include<stdlib.h>
#include<string.h>
#include<stdio.h>
#include <ctype.h>
#include <fstream>

using namespace std;

int intValor=0;

class Empleados
{
	public:
	void capturar();
	void mostrar();
	void modificar(string );
	void buscar(string );
	void eliminar(string );

	private:
	string Nombre, Area;
	string Codigo;
}x;


//###############################################################################################################################Capturar

void Empleados::capturar()
{
	string clave, strRetVal;  int COD=0, entero, NOM, AR;  bool band=true;  char *myBuff;
	char otro;
	    do{
                system("cls");
	ofstream empleado("Empleados.txt", ios::app);
     cout<<"\n\tIngresar Nombre:   \t"<<endl;	fflush(stdin); getline(cin, Nombre);	   NOM = Nombre.length();
	cout<<"\tIngresar Area:     \t"<<endl;    fflush(stdin); getline(cin, Area);         AR = Area.length();

	Codigo=(Nombre.substr(0,1)+Area.substr(0,1));	intValor=intValor+((Nombre.length()+Area.length())/2);
    myBuff = new char[100];
    memset(myBuff,'\0',100);
    itoa(intValor,myBuff,10);
    strRetVal = myBuff;
    delete[] myBuff;

    Codigo=Codigo+strRetVal;
    cout<<Codigo<<endl;

	COD = Codigo.length();

	empleado.write((char*) &COD,  sizeof(int));  empleado<<Codigo;
	empleado.write((char*) &NOM,  sizeof(int));  empleado<<Nombre;
	empleado.write((char*) &AR,   sizeof(int));  empleado<<Area;

    system("cls");
	cout<<"Desea registrar mas empleados?   (S/N)\n"<<endl;
	cin>>otro;
        empleado.close();
     }while(otro=='S'||otro=='s');


		system("pause"); system("cls");

}

//##############################################################################################################################Mostrar


void Empleados::mostrar()
{
    		int n;
    		char tmp[100];
    		system("cls");
	fstream empleado("Empleados.txt", ios::in|ios::out);
	if(!empleado.good())
	{
		cout<<"\nError En Archivo\n";
	}
	else
	{
	    cout << endl << "\t\tLista de empleados\n" << endl;
		do
		{

			                                                                                               empleado.read((char*) &n, sizeof(int));
			if(empleado.eof()) break;                                                                       empleado.read((char*) tmp, n); tmp[n]= '\0';
			cout << "Codigo:   \t" << tmp << endl;  fflush(stdin); empleado.read((char*) &n, sizeof(int));  empleado.read((char*) tmp, n); tmp[n]= '\0';
			cout << "Nombre:   \t" << tmp << endl;  fflush(stdin); empleado.read((char*) &n, sizeof(int));  empleado.read((char*) tmp, n); tmp[n]= '\0';
			cout << "Area:     \t" << tmp << endl;
			cout << "----------------------------------------------------------------" <<endl;
		}while(!empleado.eof());
	}
	empleado.close();
	system("pause"); system("cls");

}

//###################################################################################################################################Eliminar

void Empleados::eliminar(string Cod)
{
bool band = false, band2=false;
	int  n;
	string nombre, codigo, area, op;
	char tmp[100],cod[100],ar[100];

	fstream empleados("Empleados.txt", ios::in|ios::out);

	if(!empleados.good())
	{ 	 cout<<"\tError En Archivo\n\n";  	}
	else
	{
		while(!empleados.eof())
		{
			                                                empleados.read((char*) &n, sizeof(int));
			if(empleados.eof()) {        break;        }
			                                                empleados.read((char*) cod, n);              cod[n]= '\0';
			                                                empleados.read((char*) &n, sizeof(int));      empleados.read((char*) tmp, n);	tmp[n]= '\0';

			if(string(cod).compare(Cod)==0)
			{
				cout << "Código:   \t" << cod  << endl;
				cout << "Nombre:   \t" << tmp   << endl;     empleados.read((char*) &n, sizeof(int));        empleados.read((char*) ar, n);   ar[n]= '\0';
				cout << "Area:     \t" << ar  << endl;
				cout << "---------------------------------------------------" <<endl;
				cout<<"\n\nDesea eleminar  Empleado?    (S/N) \n\n\t"; fflush(stdin); getline(cin, op);  system("cls");
				if(op=="S"||op=="s")
				{
					band=true;         band2=true;
				}
				else if(op=="N"||op=="n")
				{	band=false;         band2=false;     empleados.close();   	return; 		}
				else if((op!="S"||op!="s")&&(op!="N"||op!="n"))
				{		cout << "\tOpcion Invalida\n\n";		system("pause");		system("cls");		band2=false; band=false;		}
			}
			else if(string(cod).compare(Cod)!=0)
			{
				empleados.read((char*) &n, sizeof(int));   empleados.read((char*) ar, n);   ar[n]= '\0';
			}

			if(band==false)
			{
				int a,b,c;

				nombre   = string(tmp);
				codigo   = string(cod);
				area     = string(ar);

				a = nombre.length();
				b = codigo.length();
				c = area.length();

				ofstream empleados("Empleados2.txt", ios::app);
				empleados.write((char*) &b, sizeof(int));    empleados<<codigo;
				empleados.write((char*) &a, sizeof(int));	 empleados<<nombre;
				empleados.write((char*) &c, sizeof(int));    empleados<<area;
				empleados.close();
			}
			else if(band==true)
			{
				band=false;
				band2=true;
			}
		}
		if(band2==true)
		{
			empleados.close();
			remove("Empleados.txt");
			rename("Empleados2.txt", "Empleados.txt");
			band=true;
		}
		if(band==false&&band2==false)
		{
			cout << "\tCodigo No encontrado\n\n";
		}
	}
	system("pause");   system("cls");
}

//########################################################################################################################Buscar

void Empleados::buscar(string Cod)
{

int  n;
	string nom;
	char tmp[100];
	bool band=false;
	fstream empleado("Empleados.txt", ios::in|ios::out);

	if(!empleado.good())
	{
			cout<<"\tError En Archivo\n\n";
	}
	else
	{
		while(!empleado.eof())
		{
            empleado.read((char*) &n, sizeof(int));
			if(empleado.eof())
                break;
            empleado.read((char*) &tmp, n);
            tmp[n]= '\0';
			if(string(tmp).compare(Cod) == 0)
			{
			if(empleado.eof()) break;
			cout << "Código: \t" << tmp << endl;  fflush(stdin); empleado.read((char*) &n, sizeof(int));
			 empleado.read((char*) tmp, n); tmp[n]= '\0';
			cout << "Nombre: \t" << tmp << endl;  fflush(stdin); empleado.read((char*) &n, sizeof(int));
			empleado.read((char*) tmp, n); tmp[n]= '\0';
			cout << "Area:   \t" << tmp << endl;
			    band=true;
			}
			else{   nom=tmp;   }
		}
		if(band==false)
		{
			cout<<"\tCodigo Inexistente\n\n";
		}
	}
	system("pause"); system("cls");
}
  //###################################################################################################################### Modificar
void Empleados::modificar(string Cod)
{
int band = 0, band2=0;
//	string Cod;

	fstream empleado("Empleados.txt", ios::in|ios::out);
	if(!empleado.good())
	{
		cout<<"\tError En Archivo\n\n";
	}
	else
	{
		int n; string nombre, codigo, area;   system("cls");
		char tmp[100],cod1[100],ar[100];

		while(!empleado.eof())
		{
		                               	 empleado.read((char*) &n, sizeof(int));
			if(empleado.eof()) break;    empleado.read((char*) cod1, n);                                              cod1[n]= '\0';
			                             empleado.read((char*) &n, sizeof(int));    empleado.read((char*) tmp, n);   tmp[n]= '\0';
			if(string(cod1).compare(Cod)==0)
			{
				cout << "Código:  \t" << cod1<< endl;
				cout << "Nombre:  \t" << tmp << endl;         empleado.read((char*) &n, sizeof(int));   empleado.read((char*) ar, n);  ar[n]= '\0';
				cout << "Area:    \t" << ar  << endl;
				band=1;
				cout << "\nIngrese Nueva Area:\t";   fflush(stdin);    getline(cin, area);
				band = 1;
			}
			if(string(cod1).compare(Cod)!=0)
			{
				empleado.read((char*) &n, sizeof(int));   empleado.read((char*) ar, n);   ar[n]= '\0';
			}
			if(band==0)
			{
				int a,b,c;

				nombre   = string(tmp);
				codigo   = string(cod1);
				area     = string(ar);

				a = nombre.length();
				b = codigo.length();
				c = area.length();

				ofstream empleado("Empleados2.txt", ios::app);
				empleado.write((char*) &b, sizeof(int));
				empleado<<codigo;
				empleado.write((char*) &a, sizeof(int));
				empleado<<nombre;
				empleado.write((char*) &c, sizeof(int));
				empleado<<area;
				empleado.close();
			}
			else if(band==1)
			{
				int a,b,c;
				nombre   = string(tmp);
				codigo   = string(cod1);

				a = nombre.length();
				b = codigo.length();
				c = area.length();

				ofstream empleado("Empleados2.txt", ios::app);
				empleado.write((char*) &b, sizeof(int));
				empleado<<codigo;
				empleado.write((char*) &a, sizeof(int));
				empleado<<nombre;
				empleado.write((char*) &c, sizeof(int));
				empleado<<area;
				empleado.close();
				band=0;
				band2=1;
			}
		}
		if(band2==1)
		{
			empleado.close();
			remove("Empleados.txt");
			rename("Empleados2.txt", "Empleados.txt");
			band=1;
		}
		if(band==0)
		{
			cout << "\tCodigo No encontrado\n\n";
		}
	}
	system("pause"); system("cls");

}

#endif
