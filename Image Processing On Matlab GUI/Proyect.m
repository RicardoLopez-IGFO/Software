function varargout = Proyecto(varargin)
% PROYECTO MATLAB code for Proyecto.fig
%      PROYECTO, by itself, creates a new PROYECTO or raises the existing
%      singleton*.
%
%      H = PROYECTO returns the handle to a new PROYECTO or the handle to
%      the existing singleton*.
%
%      PROYECTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROYECTO.M with the given input arguments.
%
%      PROYECTO('Property','Value',...) creates a new PROYECTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proyecto_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proyecto_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proyecto

% Last Modified by GUIDE v2.5 29-Nov-2020 17:28:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proyecto_OpeningFcn, ...
                   'gui_OutputFcn',  @Proyecto_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Proyecto is made visible.
function Proyecto_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles); evalin( 'base', 'clearvars *' ); clc;
x=ones(2000,2000,'double'); axes(handles.axes1);  imshow(x);


% --- Outputs from this function are returned to the command line.
function varargout = Proyecto_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on selection change in MenuBarraMR.
function MenuBarraMR_Callback(hObject, eventdata, handles)
opc=get(handles.MenuBarraMR,'Value');       Aopc=evalin('base','Aopc');Steps=[1/100, 1/10];
set(handles.SliderXMR,'SliderStep', Steps); set(handles.SliderYMR,'SliderStep', Steps); set(handles.SliderZMR,'SliderStep', Steps);
set(handles.ValueYMR,'String','');          set(handles.ValueXMR,'String','');        set(handles.ValueZMR,'String','');
set(handles.SliderZMR,'Value',0);           set(handles.SliderXMR,'Value',0);         set(handles.SliderYMR,'Value',0);
set(handles.TextXMR,'Visible','Off');       set(handles.TextYMR,'Visible','Off');     set(handles.TextZMR,'Visible','Off'); 
set(handles.ValueXMR,'Visible','Off');      set(handles.ValueYMR,'Visible','Off');    set(handles.ValueZMR,'Visible','Off');
set(handles.SliderXMR,'Visible','Off');     set(handles.SliderYMR,'Visible','Off');   set(handles.SliderZMR,'Visible','Off');
set(handles.uipanel8,'Visible','Off');      set(handles.uipanel9,'Visible','Off');    set(handles.AplicarMR,'Visible','Off');
set(handles.GuardarCambios, 'Enable', 'Off'); set(handles.AlmacenarImagen, 'Enable', 'Off');
switch Aopc
    case 1 % Movimientos
        switch opc
            case 1  %Giro
                set(handles.TextXMR,'String','Giro (Angulo):');
                set(handles.TextXMR,'Visible','On');   set(handles.SliderXMR,'Visible','On'); 
                set(handles.ValueXMR,'Visible','On');             
            case 2  %Traslacion
                set(handles.TextXMR,'String','Traslacion x:'); set(handles.TextYMR,'String','Traslacion y:');
                set(handles.TextXMR,'Visible','On');           set(handles.SliderXMR,'Visible','On'); 
                set(handles.TextYMR,'Visible','On');           set(handles.SliderYMR,'Visible','On');
                set(handles.ValueYMR,'Visible','On');           set(handles.ValueXMR,'Visible','On');    
            case 3  %Inclinacion
                set(handles.TextXMR,'String','Inclinacion x:'); set(handles.TextYMR,'String','Inclinacion y:');
                set(handles.TextXMR,'Visible','On');            set(handles.SliderXMR,'Visible','On'); 
                set(handles.TextYMR,'Visible','On');            set(handles.SliderYMR,'Visible','On');
                set(handles.ValueYMR,'Visible','On');            set(handles.ValueXMR,'Visible','On');      
        end
    case 2 % Resolucion
        switch opc
            case 2  %Escalado
                [M,N,O]=size(evalin('base','x')); 
                if M<1500&&N<1500
                set(handles.TextXMR,'String','Escalado x:'); set(handles.TextYMR,'String','Escalado y:');
                set(handles.TextXMR,'Visible','On');         set(handles.SliderXMR,'Visible','On'); 
                set(handles.TextYMR,'Visible','On');         set(handles.SliderYMR,'Visible','On');
                set(handles.ValueYMR,'Visible','On');        set(handles.ValueXMR,'Visible','On');
                else 
                    warndlg('Elige Una Imagen Más Pequeña', 'Mensaje');
                end
            case 3  %Kronecker
                [M,N,O]=size(evalin('base','x')); 
                if M<1500&&N<1500
                set(handles.TextXMR,'String','Kronecker en x:'); set(handles.TextYMR,'String','Kronecker en y:');
                set(handles.TextXMR,'Visible','On');             set(handles.SliderXMR,'Visible','On'); 
                set(handles.TextYMR,'Visible','On');             set(handles.SliderYMR,'Visible','On');
                set(handles.ValueYMR,'Visible','On');            set(handles.ValueXMR,'Visible','On'); 
                else
                    warndlg('Elige Una Imagen Más Pequeña', 'Mensaje');
                end
            case 4  %Padding
                [M,N,O]=size(evalin('base','x')); 
                if M<1500&&N<1500
                set(handles.TextXMR,'String','Padding en x:'); set(handles.TextYMR,'String','Padding en y:');
                set(handles.TextXMR,'Visible','On');           set(handles.SliderXMR,'Visible','On'); 
                set(handles.TextYMR,'Visible','On');           set(handles.SliderYMR,'Visible','On');
                set(handles.ValueYMR,'Visible','On');          set(handles.ValueXMR,'Visible','On'); 
                else
                    warndlg('Elige Una Imagen Más Pequeña', 'Mensaje');
                end
            case 5  %Submuestreo
                x=evalin('base','x');  [M,N,O]=size(x);
                set(handles.TextXMR,'String','Submuestreo x:'); set(handles.TextYMR,'String','Submuestreo y:');
                set(handles.TextXMR,'Visible','On');            set(handles.SliderXMR,'Visible','On'); 
                set(handles.TextYMR,'Visible','On');            set(handles.SliderYMR,'Visible','On');
                set(handles.ValueYMR,'Visible','On');           set(handles.ValueXMR,'Visible','On');   
                Steps1=[1/((M)-1), 1/((M*10)-1)];               Steps2=[1/((N)-1), 1/((N*10)-1)];
                set(handles.SliderXMR,'SliderStep', Steps1);    set(handles.SliderYMR,'SliderStep', Steps2); 
            case 7  %Cambio De Orden Capas RGB
                x=evalin('base','x');  [M,N,O]=size(x);
                if O<3
                    warndlg('Elige Una Imagen A Color', 'Mensaje');
                else
                    set(handles.uipanel9,'Visible','On');                  set(handles.pushbuttonB,'Enable','On');
                    set(handles.pushbuttonG,'Enable','On');                set(handles.pushbuttonR,'Enable','On');      
                    set(handles.pushbuttonG,'BackgroundColor','White');    set(handles.pushbuttonR,'BackgroundColor','White');     
                    set(handles.pushbuttonB,'BackgroundColor','White');    RedButton=0; GreenButton=0; BlueButton=0;
                    assignin('base','RedButton',RedButton); assignin('base','GreenButton',GreenButton); assignin('base','BlueButton',BlueButton);
                    set(handles.uipanel9,'Visible','On');   x=evalin('base','x'); [M,N,O]=size(x);      xi=zeros(M,N,O);  assignin('base','xi',xi);    
                end
                
            case 8  %Discrimacion De Capas
                    x=evalin('base','x');  [M,N,O]=size(x);
                if O<3
                    warndlg('Elige Una Imagen A Color', 'Mensaje');
                else 
                    set(handles.uipanel8,'Visible','On');  x=evalin('base','x'); [M,N,O]=size(x); XR=zeros(M,N,O);  XG=XR;   XB=XR;
                    assignin('base','XR',XR);  assignin('base','XB',XB);  assignin('base','XG',XG);
                    set(handles.checkboxR,'Value',0);  set(handles.checkboxG,'Value',0);  set(handles.checkboxB,'Value',0);   
                end
            case 9  %Modificacion Del Factor De Color
                x=evalin('base','x');  [M,N,O]=size(x);
                if O<3
                    warndlg('Elige Una Imagen A Color', 'Mensaje');
                else 
                    set(handles.TextYMR,'String','RED:');  set(handles.TextXMR,'String','GREEN:');   set(handles.TextZMR,'String','BLUE:');
                    set(handles.TextXMR,'Visible','On');   set(handles.TextYMR,'Visible','On');      set(handles.TextZMR,'Visible','On');
                    set(handles.ValueYMR,'Visible','On');  set(handles.ValueXMR,'Visible','On');     set(handles.ValueZMR,'Visible','On');
                    set(handles.SliderYMR,'Visible','On'); set(handles.SliderXMR,'Visible','On');    set(handles.SliderZMR,'Visible','On');
                end
            case 11  %Radiometrica
                set(handles.TextXMR,'String','Numero De Bits:');  set(handles.ValueXMR,'Visible','On');
                set(handles.TextXMR,'Visible','On');              set(handles.SliderXMR,'Visible','On');     
        end
end

% --- Executes during object creation, after setting all properties.
function MenuBarraMR_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function SliderXMR_Callback(hObject, eventdata, handles)
set(handles.AplicarMR, 'Visible', 'On');
set(handles.AplicarMR, 'Enable', 'on');
Cx=get(handles.SliderXMR,'Value'); assignin('base','Cx',Cx);

% --- Executes on slider movement.
function SliderYMR_Callback(hObject, eventdata, handles)
set(handles.AplicarMR, 'Visible', 'On');
set(handles.AplicarMR, 'Enable', 'on');
Cy=get(handles.SliderYMR,'Value'); assignin('base','Cy',Cy);

% --- Executes on slider movement.
function SliderZMR_Callback(hObject, eventdata, handles)
set(handles.AplicarMR, 'Visible', 'On');
set(handles.AplicarMR, 'Enable', 'on');
Cz=get(handles.SliderZMR,'Value'); assignin('base','Cz',Cz);

% --- Executes during object creation, after setting all properties.
function SliderXMR_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function SliderYMR_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function SliderZMR_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in AplicarMR.
function AplicarMR_Callback(hObject, eventdata, handles)
opc=get(handles.MenuBarraMR,'Value'); Aopc=evalin('base','Aopc'); x=evalin('base','x'); xi=evalin('base','xi'); [M,N,O]=size(x);   
set(handles.AplicarMR, 'Enable', 'off'); set(handles.AplicarMR, 'BackgroundColor', 'red'); pause(.5); set(handles.GuardarCambios, 'Enable', 'On');
switch Aopc
    case 1 % Movimientos
        switch opc
            case 1 %Giro
                    a=round(evalin('base','Cx')*360); Theta=degtorad(a);  H=[cos(Theta), -sin(Theta);sin(Theta), cos(Theta)];
                    angulo=(Theta>=0 && Theta <pi/2) + 2*(Theta>=pi/2 && Theta <pi)...
                    +3*(Theta>=pi && Theta <3*pi/2) + 4*(Theta>=3*pi/2 && Theta <=2*pi);
                    switch angulo
                      case 1 % entre 0 y pi/2
                        sumu=round(0*cos(Theta)-N*sin(Theta)); sumv=0;
                      case 2 % entre pi/2 y pi
                        sumu=round(M*cos(Theta)-N*sin(Theta)); sumv=round(0*sin(Theta)+N*cos(Theta));
                      case 3 % entre pi y 3*pi/2
                        sumu=round(M*cos(Theta)-0*sin(Theta)); sumv=round(M*sin(Theta)+N*cos(Theta));
                      case 4 % entre 3*pi/2 y 2*pi
                        sumu=0; sumv=round(M*sin(Theta)+0*cos(Theta));
                    end
                    for x1=1:M
                      for y=1:N
                        uv=round(H*[x1;y]); u=uv(1)-sumu; v=uv(2)-sumv; u=u*(u>=1)+(u<1); v=v*(v>=1)+(v<1); Y(u,v,:)=x(x1,y,:);
                      end
                    end
                    Numero=num2str(a); Numero=strcat(Numero,'°'); set(handles.ValueXMR,'String',Numero);     
                    axes(handles.axes1);  imshow(Y);  xi=Y; assignin('base','xi',xi);
            case 2 %Traslacion
                Cx=evalin('base','Cx');  Cy=evalin('base','Cy'); 
                Cx=round((M/2)*Cx); Cy=round((N/2)*Cy);           T=[1 0 Cx ; 0 1 Cy ; 0 0 1]; 
                set(handles.ValueXMR,'String',num2str(Cx));      set(handles.ValueYMR,'String',num2str(Cy));
                Y=Transformation(x,T);  axes(handles.axes1);  imshow(Y);  xi=Y; assignin('base','xi',xi);
            case 3 %Inclinacion
                Cx=evalin('base','Cx'); Cx=round(3*Cx);
                Cy=evalin('base','Cy'); Cy=round(3*Cy);       T=[1 Cx 0 ; Cy 1 0 ; 0 0 1];
                set(handles.ValueXMR,'String',num2str(Cx));      set(handles.ValueYMR,'String',num2str(Cy));
                Y=Transformation(x,T);  axes(handles.axes1);  imshow(Y);  xi=Y; assignin('base','xi',xi);
        end
    case 2 % Resolucion
        switch opc
            case 2  %Escalado
                Cx=evalin('base','Cx'); Cx=(5*Cx);  Cy=evalin('base','Cy');  Cy=(5*Cy);  T=[Cx 0 0 ; 0 Cy 0 ; 0 0 1];
                set(handles.ValueXMR,'String',num2str(Cx));        set(handles.ValueYMR,'String',num2str(Cy));
                Y=Transformation(x,T);    axes(handles.axes1);  imshow(Y);  xi=Y; assignin('base','xi',xi);
            case 3  %Producto Kronecker
                Cx=evalin('base','Cx');   Cx=round(4*Cx)+1;      Cy=evalin('base','Cy');   Cy=round(4*Cy)+1;
                set(handles.ValueXMR,'String',num2str(Cx));      set(handles.ValueYMR,'String',num2str(Cy));
                if O==3
                h=ones(Cy,Cx);  r=x(:,:,1);  g=x(:,:,2);  b=x(:,:,3);
                y1=kron(r,h);  y2=kron(g,h); y3=kron(b,h); Y(:,:,1)=y1;   Y(:,:,2)=y2;  Y(:,:,3)=y3;
                else
                h=ones(Cy,Cx); x=Gray(x); Y=kron(x,h); 
                axes(handles.axes1); imshow(Y);   xi=Y; assignin('base','xi',xi);      
                end
                axes(handles.axes1); imshow(Y);   xi=Y; assignin('base','xi',xi);        
            case 4  %Zero Padding 
                Cx=evalin('base','Cx');   Cy=evalin('base','Cy'); 
                k1=(round(4*Cx)+1);  k2=(round(4*Cy)+1);
                [M,N,O]=size(x);          Xf=fftshift(fft2(x));
                newM=round(M.*k1);        newN=round(N.*k2);   Yf=zeros(newM ,newN,O);
                A=(newM-M)/2+1:(newM-M)/2+M;                   B=(newN-N)/2+1:(newN-N)/2+N;      Yf(A,B,:)=Xf;
                Y=ifft2(ifftshift(Yf));                        Y=Y/max(Y(:));
                set(handles.ValueXMR,'String',num2str(k1));    set(handles.ValueYMR,'String',num2str(k2));
                axes(handles.axes1);    imshow(Y);    xi=Y;    assignin('base','xi',xi);
            case 5  %Submuestreo
                n1=round((M)*get(handles.SliderXMR,'Value'))+1;  n2=round((N)*get(handles.SliderYMR,'Value'))+1;
                set(handles.ValueXMR,'String',num2str(n1));       set(handles.ValueYMR,'String',num2str(n2));
                Y=x(1:n1:end,1:n2:end,:); axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi);
            case 7  %Cambio De Orden En Capas RGB
                axes(handles.axes1); imshow(xi); set(handles.AplicarMR,'Visible','Off'); MenuBarraMR_Callback(hObject,eventdata,handles);
            case 8  %Discriminacion De Capas
                XR=evalin('base','XR'); XG=evalin('base','XG'); XB=evalin('base','XB');
                Y(:,:,1)=XR(:,:,1);  Y(:,:,2)=XG(:,:,2);  Y(:,:,3)=XB(:,:,3);
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); 
            case 9  %Modificacion Factor Del Color
                [M,N,O]=size(x); XR=zeros(M,N,O); XG=XR;  XB=XR;
                XR(:,:,1)=x(:,:,1); XG(:,:,2)=x(:,:,2);   XB(:,:,3)=x(:,:,3);
                R=get(handles.SliderYMR,'Value')+.1;      G=get(handles.SliderXMR,'Value')+.1; B=get(handles.SliderZMR,'Value')+.1; 
                XR=XR.*R; XG=XG.*G; XB=XB.*B; set(handles.ValueYMR,'String',num2str(R));set(handles.ValueXMR,'String',num2str(G)); 
                set(handles.ValueZMR,'String',num2str(B)); Y(:,:,1)=XR(:,:,1);  Y(:,:,2)=XG(:,:,2);  Y(:,:,3)=XB(:,:,3);
                axes(handles.axes1); imshow(Y); xi=Y;      assignin('base','xi',xi);
            case 11  %Resolucion Radiométrica
                k= round(8*get(handles.SliderXMR,'Value')); n=2^k; x=Gray(x); Xrad=round(n*x)/n; 
                set(handles.ValueXMR,'String',num2str(k)); axes(handles.axes1); imshow(Xrad); xi=Xrad; assignin('base','xi',xi);
        end
end
set(handles.AplicarMR, 'Value', 0);    set(handles.AplicarMR, 'BackgroundColor', 'white');
set(handles.MenuBarraMR, 'Enable', 'on');  set(handles.AplicarMR, 'Enable', 'on');
set(handles.SliderXMR, 'Enable', 'on');    set(handles.SliderYMR, 'Enable', 'on');
[M,N,O]=size(xi);  str1 = [num2str(N)];str2 = [num2str(M)];
str3=[num2str(O)];str1=strcat(str1,'x'); str2=strcat(str2,'x'); 
str=strcat(str1,str2); str=strcat(str,str3); set(handles.Dimentions,'String',str);
                
% --- Executes on button press in pushbuttonG.
function pushbuttonG_Callback(hObject, eventdata, handles) %GreenButton
x=evalin('base','x'); xi=evalin('base','xi');[M,N,O]=size(x); XG=zeros(M,N,O); XG(:,:,2)=x(:,:,2); 
RedButton=evalin('base','RedButton'); GreenButton=evalin('base','GreenButton');  BlueButton=evalin('base','BlueButton');
if RedButton==1&&BlueButton==1
    xi(:,:,3)=XG(:,:,2);
elseif RedButton==1||BlueButton==1
    xi(:,:,2)=XG(:,:,2);
else
    xi(:,:,1)=XG(:,:,2);
end
set(handles.AplicarMR,'Enable','On'); set(handles.pushbuttonG,'BackgroundColor','Green');
set(handles.pushbuttonG,'Enable','Off'); GreenButton=get(handles.pushbuttonG,'Value'); 
assignin('base','GreenButton',GreenButton); assignin('base','xi',xi); 
if BlueButton==1&&RedButton==1&&GreenButton==1
    set(handles.AplicarMR,'Visible','On');
end

% --- Executes on button press in pushbuttonR.
function pushbuttonR_Callback(hObject, eventdata, handles)
x=evalin('base','x'); xi=evalin('base','xi'); [M,N,O]=size(x); XR=zeros(M,N,O); XR(:,:,1)=x(:,:,1);
RedButton=evalin('base','RedButton'); GreenButton=evalin('base','GreenButton');  BlueButton=evalin('base','BlueButton');
if GreenButton==1&&BlueButton==1
    xi(:,:,3)=XR(:,:,1);
elseif BlueButton==1||GreenButton==1
    xi(:,:,2)=XR(:,:,1);
else
    xi(:,:,1)=XR(:,:,1);
end
set(handles.AplicarMR,'Enable','On'); set(handles.pushbuttonR,'BackgroundColor','Red');
set(handles.pushbuttonR,'Enable','Off'); RedButton=get(handles.pushbuttonR,'Value'); 
assignin('base','RedButton',RedButton); assignin('base','xi',xi);
if BlueButton==1&&RedButton==1&&GreenButton==1
    set(handles.AplicarMR,'Visible','On');
end

% --- Executes on button press in pushbuttonB.
function pushbuttonB_Callback(hObject, eventdata, handles)
x=evalin('base','x'); xi=evalin('base','xi');[M,N,O]=size(x); XB=zeros(M,N,O); XB(:,:,3)=x(:,:,3);
RedButton=evalin('base','RedButton'); GreenButton=evalin('base','GreenButton');  BlueButton=evalin('base','BlueButton');
if RedButton==1&&GreenButton==1
    xi(:,:,3)=XB(:,:,3);
elseif RedButton==1||GreenButton==1
    xi(:,:,2)=XB(:,:,3);
else
    xi(:,:,1)=XB(:,:,3);
end
set(handles.AplicarMR,'Enable','On'); set(handles.pushbuttonB,'BackgroundColor','Blue');
set(handles.pushbuttonB,'Enable','Off');BlueButton=get(handles.pushbuttonB,'Value'); 
assignin('base','BlueButton',BlueButton); assignin('base','xi',xi);
if BlueButton==1&&RedButton==1&&GreenButton==1
    set(handles.AplicarMR,'Visible','On');
end

% --------------------------------------------------------------------
function CargarImagen_Callback(hObject, eventdata, handles) %Abrir Imagen 
hold off; evalin( 'base', 'clearvars *' ); clc;
[filename, pathname] = uigetfile( ...
       '*.jpg', ...
        'Pick a file', ...
        'MultiSelect', 'on');
if isequal(filename,0)||isequal(pathname,0)
    disp('User Pressed "Cancel"');   warndlg('Elige una Imagen', 'Advertencia');  set(handles.uibuttongroup1,'Visible','Off');
    set(handles.PanelMR,'Visible','Off');   set(handles.PanelF,'Visible','Off');  set(handles.Dimentions,'Visible','Off');
    x=ones(2000,2000,'double'); axes(handles.axes1);  imshow(x);  set(handles.AlmacenarImagen,'Enable','Off');
    set(handles.AplicarF,'Visible','Off'); set(handles.AplicarMR,'Visible','Off'); set(handles.GuardarCambios,'Enable','Off');
else
    x=imread([pathname, filename]); x=im2double(x); axes(handles.axes1); imshow(x);
    assignin('base','pathname',pathname);    assignin('base','filename',filename);
    assignin('base','x',x);                  xi=x; assignin('base','xi',xi);
    set(handles.GuardarCambios, 'Enable', 'on'); set(handles.uibuttongroup1, 'Visible', 'on');
    set(handles.PanelMR,'Visible','Off');   set(handles.PanelF,'Visible','Off');
    set(handles.checkboxR, 'Enable', 'on'); [M,N,O]=size(x);  str1 = [num2str(N)];str2 = [num2str(M)];
    str3=[num2str(O)];str1=strcat(str1,'x'); str2=strcat(str2,'x'); set(handles.Dimentions,'Visible','On');
    set(handles.AplicarF,'Visible','Off'); set(handles.AplicarMR,'Visible','Off'); set(handles.GuardarCambios,'Enable','Off');
    str=strcat(str1,str2); str=strcat(str,str3); set(handles.Dimentions,'String',str);  set(handles.AlmacenarImagen,'Enable','Off');
end

% --------------------------------------------------------------------
function GuardarCambios_Callback(hObject, eventdata, handles)   %Guardar Cambios
button=questdlg(sprintf('¿Guardar Cambios?'), 'Mensaje', 'Si', 'No', 'Si'); drawnow;
if strcmpi(button, 'Si')
    x=evalin('base','x');  xi=evalin('base','xi'); x=xi;  assignin('base','x',x);
    msgbox('¡Cambios Guardados!','Mensaje');  set(handles.AlmacenarImagen,'Enable','On');
else 
    msgbox('¡Cambios Cancelados!','Mensaje'); set(handles.AlmacenarImagen,'Enable','Off');
end

% --------------------------------------------------------------------
function AlmacenarImagen_Callback(hObject, eventdata, handles)  %Almacenar (Exportar) Imagen
button=questdlg(sprintf('¿Almacenar Imagen?'), 'Mensaje', 'Si', 'No', 'Si'); drawnow;
if strcmpi(button, 'Si')
    pathname=evalin('base','pathname'); filename=evalin('base','filename'); x=evalin('base','x');
    n=round((randi(100)/randi(50))+randi(300));   n=num2str(n);
    data=split(filename,'.');   s1=(data(1,1));   s2=(data(2,1));
    name=strcat(s1(1,1), n); name=strcat(name,'.'); name=strcat(name,s2(1,1));
    fullfilename=strcat(pathname,name); fullfilename=cell2mat(fullfilename);
    imwrite(x,fullfilename); msgbox('¡Almacenamiento Exitoso!','Mensaje');
else 
    msgbox('¡Almacenamiento Cancelado!','Mensaje'); 
end

% --- Executes on button press in Movimiento.
function Movimiento_Callback(hObject, eventdata, handles)
MenuText={'- Giro -';'- Traslacion -';'- Inclinacion -'};
set(handles.MenuBarraMR, 'String', MenuText); set(handles.PanelMR, 'Title', 'Movimientos');
set(handles.PanelMR, 'Visible', 'On');        set(handles.PanelF, 'Visible', 'Off');
set(handles.TextXMR,'Visible','Off');         set(handles.SliderXMR,'Visible','Off'); 
set(handles.TextYMR,'Visible','Off');         set(handles.SliderYMR,'Visible','Off');
set(handles.ValueYMR,'Visible','Off');        set(handles.ValueXMR,'Visible','Off');
set(handles.TextZMR,'Visible','Off');         set(handles.ValueZMR,'Visible','Off');
set(handles.MenuBarraMR,'Value',1);           set(handles.SliderZMR,'Visible','Off');
set(handles.uipanel8,'Visible','Off');        set(handles.AplicarMR,'Visible','Off');
Aopc=1; assignin('base','Aopc', Aopc);        set(handles.GuardarCambios, 'Enable', 'Off');
set(handles.AlmacenarImagen, 'Enable', 'Off');

% --- Executes on button press in Resolu.
function Resolu_Callback(hObject, eventdata, handles)
Menu1={'         <Escalado>';'         <Producto Kronecker>';'         <Zero Padding>';'         <Submuestreo>'};    
Menu2={'         <Cambio Capas>';'         <Discriminacion Capas>';'         <Factor De Color>'};
Menu3={'         <Número De Bits>'};
MenuText={'- Espacial -';char(Menu1);'- Espectral -';char(Menu2);'- Radiométrica -';char(Menu3)};  
set(handles.MenuBarraMR, 'String', MenuText); set(handles.PanelMR, 'Title', 'Resolucion');
set(handles.PanelMR, 'Visible', 'On');   set(handles.PanelF, 'Visible', 'Off');
set(handles.TextXMR,'Visible','Off');    set(handles.SliderXMR,'Visible','Off'); 
set(handles.TextYMR,'Visible','Off');    set(handles.SliderYMR,'Visible','Off');
set(handles.ValueYMR,'Visible','Off');   set(handles.ValueXMR,'Visible','Off');
set(handles.TextZMR,'Visible','Off');    set(handles.ValueZMR,'Visible','Off');
set(handles.MenuBarraMR,'Value',1);      set(handles.SliderZMR,'Visible','Off');
set(handles.uipanel8,'Visible','Off');   set(handles.AplicarMR,'Visible','Off');
Aopc=2; assignin('base','Aopc', Aopc);   set(handles.GuardarCambios, 'Enable', 'Off');
set(handles.AlmacenarImagen, 'Enable', 'Off');

% --- Executes on button press in FiltroEsp.
function FiltroEsp_Callback(hObject, eventdata, handles)
SobelMenu={'              Inferior';'              Superior';'              Derecha';'              Izquierda'};
PrewittMenu={'              Horizontal';'              Vertical';'              +45°';'              -45°'};
Menu1={'        <Laplace 9 Puntos>';'        <Laplace 5 Puntos Laterales>';...
    '        <Laplace 5 Puntos Esquinados>';'        <Sobel>';char(SobelMenu);'        <Prewitt>';char(PrewittMenu)};   
Menu2={'        <Dimension Impar>'};
MenuText={'- Pasa Altas -';char(Menu1);'- Pasa Bajas -';char(Menu2)};
set(handles.MenuBarraF, 'String', MenuText); set(handles.PanelF, 'Title', 'Filtro Espacial');
set(handles.PanelF, 'Visible', 'On');        set(handles.PanelMR, 'Visible', 'Off');
set(handles.TextXF,'Visible','Off');         set(handles.SliderYF,'Visible','Off'); 
set(handles.TextYF,'Visible','Off');         set(handles.SliderXF,'Visible','Off');
set(handles.ValueYF,'Visible','Off');        set(handles.ValueXF,'Visible','Off');
set(handles.MenuBarraF,'Value',1);           set(handles.AplicarF,'Visible','Off');
Bopc=1; assignin('base','Bopc', Bopc);       set(handles.GuardarCambios, 'Enable', 'Off');
set(handles.AlmacenarImagen, 'Enable', 'Off');

% --- Executes on button press in FiltroFrec.
function FiltroFrec_Callback(hObject, eventdata, handles)
Menu1={'        <Rectangular>';'        <Gaussiano>';'        <Gauss Modificado>';...
    '        <Coseno>';'        <Hanning>';'        <Bartlet>'}; 
Menu2={'        <Rectangular>';'        <Gaussiano>';'        <Gauss Modificado>';...
    '        <Coseno>';'        <Hanning>';'        <Bartlet>'}; 
MenuText={'- Pasa Altas -';char(Menu1);'- Pasa Bajas -';char(Menu2)};
set(handles.MenuBarraF, 'String', MenuText); set(handles.PanelF, 'Title', 'Filtro Frecuencial');
set(handles.PanelF, 'Visible', 'On');        set(handles.PanelMR, 'Visible', 'Off');
set(handles.TextXF,'Visible','Off');         set(handles.SliderYF,'Visible','Off'); 
set(handles.TextYF,'Visible','Off');         set(handles.SliderXF,'Visible','Off');
set(handles.ValueYF,'Visible','Off');        set(handles.ValueXF,'Visible','Off');
set(handles.MenuBarraF,'Value',1);           set(handles.AplicarF,'Visible','Off');
Bopc=2; assignin('base','Bopc', Bopc);       set(handles.GuardarCambios, 'Enable', 'Off');
set(handles.AlmacenarImagen, 'Enable', 'Off');

% --- Executes on button press in AplicarF.
function AplicarF_Callback(hObject, eventdata, handles)
Bopc=evalin('base','Bopc'); opc=get(handles.MenuBarraF,'Value');
x=evalin('base','x');  [M,N,O]=size(x); xi=evalin('base','xi');
Factor=get(handles.SliderXF,'Value');   set(handles.GuardarCambios, 'Enable', 'On');
set(handles.AplicarF, 'Enable', 'off'); set(handles.AplicarF, 'BackgroundColor', 'red'); pause(.5);

switch Bopc
    case 1  %Filtros Espaciales
        switch opc 
            case 2  %Laplace 9 Puntos
                H=Kernel('High','Laplacian','Diagonals');  x=x*(Factor+.01);  set(handles.ValueXF,'String',num2str(Factor+.01));
                Y=convn(x,H,'same');  axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi);
                
            case 3  %Laplace 5 Puntos Laterales
                H=Kernel('High','Laplacian','Cross'); x=x*(Factor+.01);  Y=convn(x,H,'same');       
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); set(handles.ValueXF,'String',num2str(Factor+.01));
                
            case 4  %Laplace 5 Puntos Esquinados
                H=Kernel('High','Laplacian','Corners'); x=x*(Factor+.01);  Y=convn(x,H,'same');     
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); set(handles.ValueXF,'String',num2str(Factor+.01));
                
            case 6  %Sobel - Inferior
                H=-1*(Kernel('High','Sobel','Horizontal')); x=x*(Factor+.01);  Y=convn(x,H,'same');   
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); set(handles.ValueXF,'String',num2str(Factor+.01));
                
            case 7  %Sobel - Superior
                H=Kernel('High','Sobel','Horizontal'); x=x*(Factor+.01); Y=convn(x,H,'same');    
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); set(handles.ValueXF,'String',num2str(Factor+1.01));
                
            case 8  %Sobel - Derecha
                H=-1*(Kernel('High','Sobel','Vertical')); x=x*(Factor+.01); Y=convn(x,H,'same');  
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); set(handles.ValueXF,'String',num2str(Factor+.01));
                
            case 9  %Sobel - Izquierda
                H=Kernel('High','Sobel','Vertical'); x=x*(Factor+.01); Y=convn(x,H,'same');       
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); set(handles.ValueXF,'String',num2str(Factor+.01));
                
            case 11  %Prewitt - Horizontal
                H=Kernel('High','Prewitt','Horizontal'); x=x*(Factor+.01); Y=convn(x,H,'same');    
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); set(handles.ValueXF,'String',num2str(Factor+.01));
                
            case 12  %Prewitt - Vertical
                H=Kernel('High','Prewitt','Vertical'); x=x*(Factor+.01); Y=convn(x,H,'same');      
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); set(handles.ValueXF,'String',num2str(Factor+.01));
                
            case 13  %Prewitt -  +45°
                H=Kernel('High','Prewitt','+45'); x=x*(Factor+.01); Y=convn(x,H,'same');      
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); set(handles.ValueXF,'String',num2str(Factor+.01));
                
            case 14  %Prewitt -  -45°
                H=Kernel('High','Prewitt','-45'); x=x*(Factor+.01);  Y=convn(x,H,'same');     
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); set(handles.ValueXF,'String',num2str(Factor+.01));
                
            case 16  %Pasa Bajas-Dimension Impar
                n=2*(round(25*get(handles.SliderYF,'Value'))+1)-1;  H=Kernel('Low','Box','',n); x=x+Factor*randn(M,N,O); 
                Y=convn(x,H,'same');  axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi);
                set(handles.ValueYF,'String',num2str(n));  set(handles.ValueXF,'String',num2str(Factor));
        end
        
    case 2  %Filtros Frecuenciales
        x=Gray(x); [M,N,O]=size(x); a=M/2; b=N/2; H=zeros(M,N); 
        sigma=get(handles.SliderYF,'Value')+.1; 
        
        switch opc  %Pasa ALtas
            case 2  %Rectangular Gauss
                sigma=round(149*get(handles.SliderYF,'Value')+1); x=x*(2*Factor+.1); Xf=fftshift(fft2(x));
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        if (x1-a)^2+(y-b)^2>sigma^2         
                            H(x1,y)=1;                        %Filtro Ideal
                        end
                    end
                end
                Yf=Xf.*(1-H); Y=ifft2(ifftshift(Yf)); 
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); 
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor+.1));
                
            case 3  %Gaussiano
                x=x*(2*Factor+.1); Xf=fftshift(fft2(x));
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        dxy=sqrt(dx^2+dy^2);
                        H(x1,y)=exp((-dxy^2)/(2*sigma^2));
                    end
                end
                Yf=Xf.*(1-H);
                Y=ifft2(ifftshift(Yf));
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); 
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor+.1));
                
            case 4  %Gauss Modificado
                x=x*(2*Factor+.1); Xf=fftshift(fft2(x));
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        dxy=sqrt(dx^2+dy^2);
                        H(x1,y)=exp((-dxy^4)/(2*sigma^2));
                    end
                end
                Yf=Xf.*(1-H);
                Y=ifft2(ifftshift(Yf));
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi);
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor+.1));
                
            case 5  %Coseno
                x=x*(2*Factor+.1); Xf=fftshift(fft2(x));
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        if dx^2||dy^2<=sigma^2
                            H(x1,y)=cos(pi*dx/(2*sigma))*cos(pi*dy/(2*sigma));    %Coseno
                        end
                    end
                end
                Yf=Xf.*(1-H);
                Y=ifft2(ifftshift(Yf));
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); 
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor+.1));
            case 6  %Hanning
                x=x*(2*Factor+.1); Xf=fftshift(fft2(x));
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        dxy=sqrt(dx^2+dy^2);
                        if (dx^2+dy^2)<=sigma^2
                             H(x1,y)=(.5*cos(pi*dxy/sigma)+.5);     %Hanning
                        end
                    end
                end
                Yf=Xf.*(1-H); Y=ifft2(ifftshift(Yf));
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi);
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor+.1));
                
            case 7  %Barlet
                x=x*(2*Factor+.1); Xf=fftshift(fft2(x));
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        dxy=sqrt(dx^2+dy^2);
                        if (1-dxy/sigma)>0
                            H(x1,y)=(1-dxy/sigma);
                        end
                    end
                end
                Yf=Xf.*(1-H); Y=ifft2(ifftshift(Xf));
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi);
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor+.1));
            %Pasa Bajas
            case 9  %Rectangular
                x=x+(Factor/4)*randn(M,N,O);  Xf=fftshift(fft2(x));
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        if (x1-a)^2+(y-b)^2>sigma^2         
                            H(x1,y)=1;                        %Filtro Ideal
                        end
                    end
                end
                Yf=Xf.*H; Y=ifft2(ifftshift(Yf)); 
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); 
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor/4));
                
            case 10  %Gaussiano
                x=x+(Factor/4)*randn(M,N,O);  Xf=fftshift(fft2(x));
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        dxy=sqrt(dx^2+dy^2);
                        H(x1,y)=exp((-dxy^4)/(2*sigma^2));
                    end
                end
                Yf=Xf.*H;
                Y=ifft2(ifftshift(Yf));
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); 
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor/4));
                
            case 11  %Gaussiano Modificado
                x=x+(Factor/4)*randn(M,N,O);  Xf=fftshift(fft2(x)); 
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        dxy=sqrt(dx^2+dy^2);
                        H(x1,y)=exp((-dxy^4)/(2*sigma^2));
                    end
                end
                Yf=Xf.*H; Y=ifft2(ifftshift(Yf));
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); 
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor/4));
                
            case 12  %Coseno 
                x=x+(Factor/4)*randn(M,N,O);  Xf=fftshift(fft2(x)); 
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        if dx^2||dy^2<=sigma^2
                            H(x1,y)=cos(pi*dx/(2*sigma))*cos(pi*dy/(2*sigma));    %Coseno
                        end
                    end
                end
                Yf=Xf.*H; Y=ifft2(ifftshift(Yf));
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi); 
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor/4));  
            case 13  %Hanning
                x=x+(Factor/4)*randn(M,N,O);  Xf=fftshift(fft2(x)); 
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        dxy=sqrt(dx^2+dy^2);
                        if (dx^2+dy^2)<=sigma^2
                             H(x1,y)=(.5*cos(pi*dxy/sigma)+.5);     %Hanning
                        end
                    end
                end
                Yf=Xf.*H; Y=ifft2(ifftshift(Yf));
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi);
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor/4));
                
            case 14  %Barlet
                x=x+(Factor/4)*randn(M,N,O);  Xf=fftshift(fft2(x)); 
                for x1=1:M
                    dx=(x1-a)/a;
                    for y=1:N
                        dy=(y-b)/b;
                        dxy=sqrt(dx^2+dy^2);
                        if (1-dxy/sigma) > 0
                            H(x1,y)=(1-dxy/sigma);
                        end
                    end
                end
                Yf=Xf.*H; Y=ifft2(ifftshift(Yf));
                axes(handles.axes1); imshow(Y); xi=Y; assignin('base','xi',xi);
                set(handles.ValueYF,'String',num2str(sigma));  set(handles.ValueXF,'String',num2str(Factor/4));    
        end
end
set(handles.AplicarF, 'Enable', 'on'); set(handles.AplicarF, 'BackgroundColor', 'white'); 
[M,N,O]=size(xi);  str1=[num2str(N)];     str2 = [num2str(M)];
str3=[num2str(O)]; str1=strcat(str1,'x'); str2=strcat(str2,'x'); 
str=strcat(str1,str2); str=strcat(str,str3); set(handles.Dimentions,'String',str);

% --- Executes on selection change in MenuBarraF.
function MenuBarraF_Callback(hObject, eventdata, handles)
Bopc=evalin('base', 'Bopc'); opc=get(handles.MenuBarraF,'Value');
set(handles.TextYF,'Visible', 'Off');    set(handles.TextXF,'Visible', 'Off');
set(handles.ValueYF,'Visible', 'Off');   set(handles.ValueXF,'Visible', 'Off');    set(handles.GuardarCambios, 'Enable', 'Off');
set(handles.SliderYF,'Visible', 'Off');  set(handles.SliderXF,'Visible', 'Off');   set(handles.SliderZF,'Visible', 'Off'); 
set(handles.TextYF,'String', '');set(handles.TextXF,'String', ''); set(handles.TextZF,'String', '');
set(handles.ValueYF,'String', '');set(handles.ValueXF,'String', ''); set(handles.ValueZF,'String', '');
set(handles.AplicarF,'Visible', 'On');   set(handles.SliderXF,'Value', 0);         set(handles.SliderYF,'Value', 0);
set(handles.AlmacenarImagen, 'Enable', 'Off');
switch Bopc
    case 1  %Filtros Espaciales
        switch opc  %Pasa Altas
            case 2  %Laplace 9 Puntos
                set(handles.TextXF,'Visible', 'On');   set(handles.ValueXF,'Visible', 'On'); set(handles.SliderXF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On'); set(handles.TextXF,'String', 'Factor De Bordes:');   
            case 3  %Laplace 5 Puntos Laterales
                set(handles.TextXF,'Visible', 'On');   set(handles.ValueXF,'Visible', 'On'); set(handles.SliderXF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On'); set(handles.TextXF,'String', 'Factor De Bordes:');      
            case 4  %Laplace 5 Puntos Esquinados Laterales
                set(handles.TextXF,'Visible', 'On');   set(handles.ValueXF,'Visible', 'On'); set(handles.SliderXF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On'); set(handles.TextXF,'String', 'Factor De Bordes:');
            case 6  %Sobel - Inferior
                set(handles.TextXF,'Visible', 'On');   set(handles.ValueXF,'Visible', 'On'); set(handles.SliderXF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On'); set(handles.TextXF,'String', 'Factor De Bordes:');  
            case 7  %Sobel - Superior
                set(handles.TextXF,'Visible', 'On');   set(handles.ValueXF,'Visible', 'On'); set(handles.SliderXF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On'); set(handles.TextXF,'String', 'Factor De Bordes:');  
            case 8  %Sobel - Derecha
                set(handles.TextXF,'Visible', 'On');   set(handles.ValueXF,'Visible', 'On'); set(handles.SliderXF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On'); set(handles.TextXF,'String', 'Factor De Bordes:');    
            case 9  %Sobel - Izquierda
                set(handles.TextXF,'Visible', 'On');   set(handles.ValueXF,'Visible', 'On'); set(handles.SliderXF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On'); set(handles.TextXF,'String', 'Factor De Bordes:');   
            case 11  %Prewitt - Horizontal
                set(handles.TextXF,'Visible', 'On');   set(handles.ValueXF,'Visible', 'On'); set(handles.SliderXF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On'); set(handles.TextXF,'String', 'Factor De Bordes:'); 
            case 12  %Prewitt - Vertical
                set(handles.TextXF,'Visible', 'On');   set(handles.ValueXF,'Visible', 'On'); set(handles.SliderXF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On'); set(handles.TextXF,'String', 'Factor De Bordes:');   
            case 13  %Prewitt -  +45°
                set(handles.TextXF,'Visible', 'On');   set(handles.ValueXF,'Visible', 'On'); set(handles.SliderXF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On'); set(handles.TextXF,'String', 'Factor De Bordes:'); 
            case 14  %Prewitt -  -45°
                set(handles.TextXF,'Visible', 'On');   set(handles.ValueXF,'Visible', 'On'); set(handles.SliderXF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On'); set(handles.TextXF,'String', 'Factor De Bordes:');    
            case 16  %Dimension Impar - Pasa Bajas
                set(handles.TextXF,'Visible', 'On');     set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');     set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');   set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Ruido:');  set(handles.TextYF,'String', 'Grado Del Filtro:');   
        end
        
    case 2  %Filtros Frecuenciales
        switch opc
            %  Pasa Altas
            case 2  %Rectangular Gauss
                set(handles.TextXF,'Visible', 'On');               set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');               set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');             set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Bordes:'); set(handles.TextYF,'String', 'Radio Del Filtro:'); 
            case 3  %Gaussiano
                set(handles.TextXF,'Visible', 'On');               set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');               set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');             set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Bordes:'); set(handles.TextYF,'String', 'Radio Del Filtro:'); 
            case 4  %Gauss Modificado
                set(handles.TextXF,'Visible', 'On');               set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');               set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');             set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Bordes:'); set(handles.TextYF,'String', 'Radio Del Filtro:'); 
            case 5  %Coseno
                set(handles.TextXF,'Visible', 'On');               set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');               set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');             set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Bordes:'); set(handles.TextYF,'String', 'Radio Del Filtro:');  
            case 6  %Hanning
                set(handles.TextXF,'Visible', 'On');               set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');               set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');             set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Bordes:'); set(handles.TextYF,'String', 'Radio Del Filtro:'); 
            case 7  %Barlet
                set(handles.TextXF,'Visible', 'On');               set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');               set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');             set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Bordes:'); set(handles.TextYF,'String', 'Radio Del Filtro:');             
                
            %  Pasa Bajas    
            case 9  %Rectangular
                set(handles.TextXF,'Visible', 'On');                set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');                set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');              set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Ruido:');   set(handles.TextYF,'String', 'Radio Del Filtro:');  
            case 10  %Gaussiano
                set(handles.TextXF,'Visible', 'On');                set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');                set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');              set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Ruido:');   set(handles.TextYF,'String', 'Radio Del Filtro:');  
            case 11  %Gaussiano Modificado
                set(handles.TextXF,'Visible', 'On');                set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');                set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');              set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Ruido:');   set(handles.TextYF,'String', 'Radio Del Filtro:'); 
            case 12  %Coseno
                set(handles.TextXF,'Visible', 'On');                set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');                set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');              set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Ruido:');   set(handles.TextYF,'String', 'Radio Del Filtro:'); 
            case 13  %Hanning
                set(handles.TextXF,'Visible', 'On');                set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');                set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');              set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Ruido:');   set(handles.TextYF,'String', 'Radio Del Filtro:'); 
            case 14  %Barlet
                set(handles.TextXF,'Visible', 'On');                set(handles.ValueXF,'Visible', 'On');
                set(handles.TextYF,'Visible', 'On');                set(handles.ValueYF,'Visible', 'On');
                set(handles.SliderXF,'Visible', 'On');              set(handles.SliderYF,'Visible', 'On');
                set(handles.TextXF,'String', 'Factor De Ruido:');   set(handles.TextYF,'String', 'Radio Del Filtro:');  
        end
end

% --- Executes during object creation, after setting all properties.
function MenuBarraF_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function SliderXF_Callback(hObject, eventdata, handles)
set(handles.AplicarF, 'Visible', 'On');  set(handles.AplicarF, 'Enable', 'On');

% --- Executes on slider movement.
function SliderYF_Callback(hObject, eventdata, handles)
set(handles.AplicarF, 'Visible', 'On');  set(handles.AplicarF, 'Enable', 'On');

% --- Executes on slider movement.
function SliderZF_Callback(hObject, eventdata, handles)
set(handles.AplicarF, 'Visible', 'On');  set(handles.AplicarF, 'Enable', 'On');

% --- Executes during object creation, after setting all properties.
function SliderXF_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function SliderYF_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function SliderZF_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)

% --- Executes on button press in checkboxB.
function checkboxB_Callback(hObject, eventdata, handles) %Blue Color
set(handles.AplicarMR, 'Visible', 'On'); set(handles.AplicarMR, 'Enable', 'on');
x=evalin('base','x');     [M,N,O]=size(x); XB=zeros(M,N,O); B=XB; 
if (get(handles.checkboxB,'Value'))==1
    XB(:,:,3)=x(:,:,3); assignin('base','XB',XB); 
else
    XB=B; assignin('base','XB',XB);
end

% --- Executes on button press in checkboxG.
function checkboxG_Callback(hObject, eventdata, handles) % Green Color
set(handles.AplicarMR, 'Visible', 'On'); set(handles.AplicarMR, 'Enable', 'on');
x=evalin('base','x');     [M,N,O]=size(x); XG=zeros(M,N,O); G=XG; 
if (get(handles.checkboxG,'Value'))==1
    XG(:,:,2)=x(:,:,2); assignin('base','XG',XG); ;
else
    XG=G; assignin('base','XG',XG); 
end

% --- Executes on button press in checkboxR.
function checkboxR_Callback(hObject, eventdata, handles)  % Red Color
set(handles.AplicarMR, 'Visible', 'On'); set(handles.AplicarMR, 'Enable', 'on');
x=evalin('base','x');     [M,N,O]=size(x); XR=zeros(M,N,O); R=XR; 
if (get(handles.checkboxR,'Value'))==1
    XR(:,:,1)=x(:,:,1); assignin('base','XR',XR); 
else
    XR=zeros(M,N,O); assignin('base','XR',XR); 
end



