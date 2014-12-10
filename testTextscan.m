tagstream_file = 'P3_2_8_p29.tagstream'
fid=fopen(tagstream_file,'r');
 disp(fid)
 disp('holla');
B = fread(fid,'*char')';
disp(B);
A=textscan(B,'%s %s','delimiter',';')
A{1}
%A = textscan(zzA,'%s','delimiter','\n')
fclose(fid);
