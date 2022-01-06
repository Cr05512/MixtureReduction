clc
clear
close all

N = 1000;
d = 2;

for i=1:N
    gmh = GMGen(10,d,2); gmr = GMGen(10,d,2); gmr3 = GMGen(10,d,2);
    a = JR2D(gmh,gmr3);
    b = (JR2D(gmh,gmr) + JR2D(gmr,gmr3));
    
    if b<a
        disp(strcat([num2str(a),',',num2str(b)]))
    end
end