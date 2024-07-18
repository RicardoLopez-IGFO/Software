function [Y] = Transformation(x,T)
%UNTITLED2 Summary of this function goes here
%   Transformation Returns a Movement
    [M,N,O]=size(x);
    if O<3
         for a=1:M
             for b=1:N
                 w=[a;b;1];
                 r=round(T*w);
                 neg=r<1;
                 r(neg)=1;
                 Y(r(1),r(2))=x(a,b);
             end
         end
    else 
         for a=1:M
             for b=1:N
                 w=[a;b;1];
                 r=round(T*w);
                 neg=r<1;
                 r(neg)=1;
                 Y(r(1),r(2),:)=x(a,b,:);
             end
         end
    end
end