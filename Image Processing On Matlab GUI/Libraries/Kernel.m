function [H] = Kernel(Option,Type,Direction,n)
%   This function returns a "H" matrix that is called "Kernel" and is used on
%   filtering process by convolution.
%
%   Function Syntax:
%               Kernel('TypeOfKernel','NameOfKernel','DirectionOrForm',Size);
%
%  "Size" is used for calculate the dimentions of the matrix NxN and is used only at "Box" Kernel
%
%   Examples:   H=Kernel('High','Laplacian','Cross');
%               H=Kernel('High','Prewitt','Vertical');
%               H=Kernel('High','Sobel','CornerDL');
%               H=Kernel('Low','Box','',3);
%
%Function's Option Map Below:
%   "Low" 
%         "Box"                        H=(1/n^2)*ones(n);
%         "Gaussian5x5"                H= (1/256)*[ 1 4 6 4 1 ; 4 16 24 16 4 ; 6 24 36 24 6; 4 16 24 16 4; 1 4 6 4 1 ];
%         "Gaussian3x3"                H=[1/16 2/16 1/16; 2/16 4/16 2/16; 1/16 2/16 1/16];
%         "Unsharp"                    H= (-1/256)*[ 1 4 6 4 1 ; 4 16 24 16 4 ; 6 24 -476 24 6; 4 16 24 16 4; 1 4 6 4 1 ];
%
%   "High"
%         "Sobel"
%                  "Horizontal"        H=[-1 0 1 ; -2 0 2 ; -1 0 1];
%                  "Vertical"          H=[-1 -2 -1 ; 0 0 0 ; 1 2 1];
%                  "CornerDL"          H=[0 1 2 ; -1 0 1 ; -2 -1 0];
%                  "CornerDR"          H=[2 1 0 ; 1 0 -1 ; 0 -1 -2];
%         "Prewitt"
%                  "Horizontal"        H=[-1 0 1 ; -1 0 1 ; -1 0 1];
%                  "Vertical"          H=[-1 -1 -1 ; 0 0 0 ; 1 1 1];
%         "Laplacian"
%                 "Cross"              H=[0 -1 0 ; -1 4 -1 ; 0 -1 0];
%                  "Diagonals"         H=[-1 -1 -1 ; -1 8 -1 ; -1 -1 -1];
%                  "Corners"           H=[-1 0 -1 ; 0 4 0 ; -1 0 -1];
%                  "ODiagonals"        H=[1 -2 1 ; -2 4 -2 ; 1 -2 1];
%         "Robert"
%                  "DiagonalR"         H=[0 1 ; -1 0];
%                  "DiagonalL"         H=[-1 0 ; 0 1];
%         "Sharpen"
%                  "Around"            H=[-1 -1  -1 ; -1 9 -1 ; -1 -1 -1]; 
%                  "Cross"             H=[0 -1  0 ; -1 5 -1 ; -0 -1 0];
%         "Emboss"
%                  "CornderUL"         H=[-2 -1 0 ; -1 1 1 ; 0 1 2];
%                  "CornerDL"          H=[0 1 2 ; -1 1 1 ; -2 -1 0]; 
%
%   "Identity"                         H=[0 0 0 ; 0 1 0 ; 0 0 0];


switch Option
    case 'Low'   
        switch Type 
            case 'Box'
                H=(1/n^2)*ones(n);                                                                  %Box Blur (Mean Filtering Or Smoothing)
            case 'Gaussian5x5'
                H= (1/256)*[ 1 4 6 4 1 ; 4 16 24 16 4 ; 6 24 36 24 6; 4 16 24 16 4; 1 4 6 4 1 ];    %Gaussian Blur Low Pass 5x5
            case 'Gaussian3x3'
                H=[1/16 2/16 1/16; 2/16 4/16 2/16; 1/16 2/16 1/16];                                 %Gaussian Blur Low Pass 3x3
            case 'Unsharp'
                H= (-1/256)*[ 1 4 6 4 1 ; 4 16 24 16 4 ; 6 24 -476 24 6; 4 16 24 16 4; 1 4 6 4 1 ]; %Unsharp Masking 5x5
            otherwise
                disp('Enter on Kernel( ... ,Type, ... ): "Box", "Gaussian5x5", "Gaussian3x3" or "Unsharp"');      
        end
        

        
    case 'High'
        switch Type
            
            case 'Sobel'
                switch Direction
                    case 'Horizontal'
                        H=[-1 -2 -1 ; 0 0 0 ; 1 2 1];    %Sobel Edge Operator - Horizontal Upper
                    case 'Vertical'
                        H=[-1 0 1 ; -2 0 2 ; -1 0 1];    %Sobel Edge Operator - Vertical Left
                    case 'CornerDL'
                        H=[0 1 2 ; -1 0 1 ; -2 -1 0];    %Sobel Edge Operator - Corner Left Lower
                    case 'CornerDR'
                        H=[2 1 0 ; 1 0 -1 ; 0 -1 -2];    %Sobel Edge Operator - Corner Right Lower 
                    otherwise
                        disp('Enter on Kernel( ... , ... ,Direction): "Horizontal", "Vertical", "CornerDR" or "CornerDL"');
                end 

                
            case 'Prewitt'
                switch Direction
                    case 'Horizontal'
                        H=[-1 0 1 ; -1 0 1 ; -1 0 1];    %Filtro Prewitt - Horizontal Left Form
                    case 'Vertical'
                        H=[-1 -1 -1 ; 0 0 0 ; 1 1 1];    %Filtro Prewitt - Vertical Upper Form
                    case '+45'
                        H=[1 1 0; 1 0 -1; 0 -1 -1];      %Filtro Prewitt - "+45°" Lower
                    case '-45'
                        H=[0 1 1; -1 0 1; -1 -1 0];      %Filtro Prewitt - "-45°" Lower 
                    otherwise
                        disp('Enter on Kernel( ... , ... ,Direction): "Horizontal", "Vertical", "+45" or "-45"');
                end 
                
                
            case 'Laplacian'
                switch Direction
                    case 'Cross'
                        H=[0 -1 0 ; -1 4 -1 ; 0 -1 0];      %Laplacian Edge Detection Filter - Cross Form
                    case 'Diagonals'
                        H=[-1 -1 -1 ; -1 8 -1 ; -1 -1 -1];  %Laplacian Edge Detection Filter - (Laplace With Diagonals)
                    case 'Corners'
                        H=[-1 0 -1 ; 0 4 0 ; -1 0 -1];      %Laplacian Edge Detection Filter - Corners Form
                    case 'ODiagonals'
                        H=[1 -2 1 ; -2 4 -2 ; 1 -2 1];      %Laplacian Edge Detection - Only Diagonals (Crossed)
                    otherwise
                        disp('Enter on Kernel( ... , ... ,Direction): "Cross", "Diagonals", "ODiagonals" or "Corners"');
                end
                
                
            case 'Robert'
                switch Direction
                    case 'DiagonalR'
                        H=[0 1 ; -1 0];   %Rober Kernel - Right Diagonal of Ceros
                    case 'DiagonalL'
                        H=[-1 0 ; 0 1];   %Rober Kernel - Left Diagonal of Ceros
                    otherwise
                        disp('Enter on Kernel( ... , ... ,Direction): "DiagonalR" or "DiagonalL"');
                end
                
                
            case 'Sharpen'
                switch Direction
                    case 'Around'
                        H=[-1 -1  -1 ; -1 9 -1 ; -1 -1 -1];   %Sharpen Edge Dectector - Round or Around Form
                    case 'Cross'
                        H=[0 -1  0 ; -1 5 -1 ; -0 -1 0];      %Sharpen Edge Dectector - Cross Form 
                    otherwise
                        disp('Enter on Kernel( ... , ... ,Direction): "DiagonalR" or "DiagonalL"');
                end
                
                
            case 'Emboss'
                switch Direction
                    case 'CornerUL'
                        H=[-2 -1 0 ; -1 1 1 ; 0 1 2];         %Emboss Kernel Convolution - Left Upper Corner
                    case 'CornerDL'
                        H=[0 1 2 ; -1 1 1 ; -2 -1 0];         %Emboss Kernel Convolution - Left Lower Corner
                    otherwise
                        disp('Enter on Kernel( ... , ... ,Direction): "CornerUL" or "CornerDL"');
                end
                
                

            otherwise
                disp('Enter on Kernel( ... ,Type, ... ): "Sobel", "Prewitt", "Sharpen", "Robert", "Linear", "Emboss" or "Laplacian"');
            
        end
        
        
    case 'Identity'
        H=[0 0 0 ; 0 1 0 ; 0 0 0];      %Identity Kernel Convolution
        
    otherwise
        disp('Enter on Kernel(Option, ... , ... ): "High", "Low" or "Identity"');
end
        
end  %Function's Final

