clear all; close all; clc;

n = linspace(0,1,257);
f = fi(0.5*sin(2*pi*1*n), 1, 8, 7);
fq = f(1:256);

figure
set(gcf,'color','w');
stem(fq,'filled','LineWidth',1);
box off; axis off;

fID = fopen('C:\Users\mateo\Desktop\Repos\direct-digital-frequency-synthesis-systemverilog\sine_0360_8bit_256.txt','w');

for i=1:length(fq)
    fprintf(fID,'%4d: q = 8''d%s;\n',i-1,hex(fq(i)));
end


