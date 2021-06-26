clc;
clear all;
close all
opts=detectImportOptions('datawp.xlsx');
opts.SelectedVariableNames = (3:8);
train=readmatrix('datawp.xlsx',opts); %untuk membaca dataset 
data1 = train(1:50,1:3);
data2 = train(1:50,6);
z = [data1 data2];
k = [0,0,1,0]; %menentukan data  cost/benefit
w = [3,5,4,1]; %menentukan bobot kriteria

%proses fiksasi bobot
[m n]=size (z); %menginisialisasi ukuran z untuk menentukan bobot 
wn=w./sum(w); %rumus untuk mencari bobot fix
 
%proses yang kedua, menghitung vektor(S) per baris
for j=1:n,
    if k(j)==0, wn(j)=-1*wn(j);
    end
end
for i=1:m,
    S(i)=prod(z(i,:).^wn);
end
V= S/sum(S); %proses terakhir, merangking data hasil
for i=1:m,
    if V(i)==max(V)
        disp("Alternatif rumah = "+max(V)+" yaitu Nomor rumah = "+i);
    end
end;
