 namv=['hb65.txt'];
 mu0=pi*4e-7;
 
 
fid=fopen(namv);
%m=fgetl(fid);
n=2;
nustr=1;
while ~(feof(fid))
    m=fgetl(fid);
    m=strrep(m,',','.');
    a{n}(nustr,:)=str2num(m);
    nustr=nustr+1;    
end
fclose(fid);

aa=a{n};
save('hb65.txt','aa','-ascii')