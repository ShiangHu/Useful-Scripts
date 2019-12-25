% get electrode locations for the CHBMP EEG 58 electrodes

clc; clear;

name =importdata('std58.mat');

ss = readlocs('standard_1005.elc'); % from fieldtrip package

ssnm = char({ss.labels}');

[idx,loc]= ismember(lower(name),lower(ssnm), 'rows');

ssn = ss(loc);

nm = char({ssn.labels}');

strcmpi(name,nm); % check two labels equal

writelocs(ssn,'cuba58.sfp','filetype','sfp');

aaa = importdata('cuba58.sfp');
x = aaa.data(:,2);
y = -aaa.data(:,1);
z = aaa.data(:,3);

fid = fopen('cuba58.sfp','w');
for i=1:58
fprintf(fid,'%s %3.4f %3.4f %3.4f\n', aaa.textdata{i}, x(i), y(i), z(i));
end
fclose(fid);


name = strcat(aaa.textdata,'-REF');


T = table(name,x,y,z);

writetable(T,'cuba58.csv','Delimiter',' ')  
