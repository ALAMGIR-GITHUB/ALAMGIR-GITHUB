
function Graph_plotting

%---------------key_length_vs_encryption_time-------------------
% key_size=[512 1024 2048 4096 8192 16384];
% encryption_time_FERET=[10 13 15 21 112 328];
% encryption_time_CASIA=[11 14 15 20 117 325];
% 
% plot(key_size, encryption_time_FERET,'r*-',key_size, encryption_time_CASIA, 'b+-');
% legend('FERET', 'CASIA-FaceV5','Location','northwest');
% grid on;
% xlabel('Key size (in bits)')
% ylabel('Encryption time (in milliseconds)')
% title('Key size vs. Encryption time')


%-------------------Key size vs. Decryption time-----------------
% key_size=[512 1024 2048 4096 8192 16384];
% decryption_time_FERET=[17 33 45 322 2178 11952];
% decryption_time_CASIA=[19 27 45 309 2195 11988];
% 
% plot(key_size, decryption_time_FERET,'r*-',key_size, decryption_time_CASIA, 'b+-');
% legend('FERET', 'CASIA-FaceV5','Location','northwest');
% grid on;
% xlabel('Key size (in bits)')
% ylabel('Decryption time (in milliseconds)')
% title('Key size vs. Decryption time')



%-------------------Key size vs. Enrollment time-----------------
% key_size=[512 1024 2048 4096 8192 16384];
% enrollment_time_FERET=[1135.9 1173.9 1225.9  1253.9 1879.9 5270.9];
% enrollment_time_CASIA=[1136.2 1173.2 1218.2  1327.2 1866.2 5276.2];
% 
% plot(key_size, enrollment_time_FERET,'r*-',key_size, enrollment_time_CASIA, 'b+-');
% legend('FERET', 'CASIA-FaceV5','Location','northwest');
% grid on;
% xlabel('Key size (in bits)')
% ylabel('Enrollment time (in milliseconds)')
% title('Key size vs. Enrollment time')


%-------------------Key size vs. Authentication time-----------------
% key_size=[512 1024 2048 4096 8192 16384];
% authentication_time_FERET=[1064.9 1080.9 1092.9  1396.9 3225.9 12999.9];
% authentication_time_CASIA=[1063.2 1071.2 1089.2  1353.2 3239.2 13032.2];
% 
% plot(key_size, authentication_time_FERET,'r*-',key_size, authentication_time_CASIA, 'b+-');
% legend('FERET', 'CASIA-FaceV5','Location','northwest');
% grid on;
% xlabel('Key size (in bits)')
% ylabel('Authentication time for a user (in milliseconds)')
% title('Key size vs. Authentication time')


% %-------------------Key size vs. Key Generation time Comparison-----------------
key_size=[512 1024 2048 4096 8192 16384];

Rivet_et_al=[92 133 352 889 4315 91542];
Ivy_et_al=[144 216 313 922 7471 93899];
Thangave_et_al=[165 237 389 1188 11164 181811];
proposed=[78 113 163 185 720 3895];


plot(key_size, Rivet_et_al, '-o', key_size,Ivy_et_al, '-s', key_size,Thangave_et_al, '-+', key_size,proposed,'b-*');
legend('Rivet et al.','Ivy et al.', 'Thangave et al.','Proposed', 'Location','northwest');

grid on;
xlabel('Key size (in bits)')
ylabel('Key Generation time (in milliseconds)')
title('Key Size vs. Key Generation Time')


% %-------------------Key size vs. Encryption time Comparison-----------------
% key_size=[512 1024 2048 4096 8192 16384];
% 
% Rivet_et_al=[1.1 1 3 21 183 1380];
% Ivy_et_al=[2.5 4 21 170 1393 10907];
% Thangave_et_al=[2 3 16 105 784 6620];
% proposed=[0.0500 0.0650 0.0750 0.1050 0.5600 1.6400];
% 
% 
% plot(key_size, Rivet_et_al, '-o', key_size,Ivy_et_al, '-s', key_size,Thangave_et_al, '-+', key_size,proposed,'-*');
% legend('Rivet et al.','Ivy et al.', 'Thangave et al.','Proposed', 'Location','northwest');
% 
% grid on;
% xlabel('Key size (in bits)')
% ylabel('Encryption Time (in miliseconds)')
% title('Key Size vs. Encryption Time')



% %-------------------Key size vs. Decryption time time Comparison-----------------
% key_size=[512 1024 2048 4096 8192 16384];
% 
% Rivet_et_al=[1.1 1.1 3 22 169 1381];
% Ivy_et_al=[2.2 3 23 169 1379 10957];
% Thangave_et_al=[2 2 16 106 745 6647];
% proposed=[0.0850 0.1650 .02250 1.6100 10.8900 59.7600];
% 
% 
% plot(key_size, Rivet_et_al, '-o', key_size,Ivy_et_al, '-s', key_size,Thangave_et_al, '-+', key_size,proposed,'-*');
% legend('Rivet et al.','Ivy et al.', 'Thangave et al.','Proposed', 'Location','northwest');
% 
% grid on;
% xlabel('Key size (in bits)')
% ylabel('Decryption Time (in miliseconds)')
% title('Key Size vs. Decryption Time')



% %-------------------Key size vs. Total Execution time Comparison-----------------
% key_size=[512 1024 2048 4096 8192 16384];
% 
% Rivet_et_al=[94.2 135.1 358 932 4667 94303];
% Ivy_et_al=[148.7 223 357 1261 10243 115763];
% Thangave_et_al=[169 242 421 1379 12693 195078];
% proposed=[78.1350 113.2300 163.3000 186.7150 731.4500 3956.4000];
% 
% 
% plot(key_size, Rivet_et_al, '-o', key_size,Ivy_et_al, '-s', key_size,Thangave_et_al, '-+', key_size,proposed,'-*');
% legend('Rivet et al.','Ivy et al.', 'Thangave et al.','Proposed', 'Location','northwest');
% 
% grid on;
% xlabel('Key size (in bits)')
% ylabel('Total Execution time (in miliseconds)')
% title('Key Size vs. Total Execution Time')

end


% RSA = [1024,2048,3072,7680,15360];
% ECC = [160,224,256,384,512]*10;
% % plot(bits, RSA,'r-');
% % plot(bits, ECC, 'g-');
% plot(bits, RSA,'r-',bits, ECC, 'g-');
% % plot(x,y1,'b',x,y2,'r')
% legend('RSA', 'ECC','Location','northwest')