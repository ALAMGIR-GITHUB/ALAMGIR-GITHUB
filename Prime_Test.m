function Prime_Test 
clc;
% N = 1:100000000;
% tic, isprime(N); toc
addpath('F:\GROUP E-BIOHASHING\BIOHASH_17_FACE_IOT\CODING\isprime_fast-master');
%TEST-1
% N = 1:1000;
% tic, isprime_fast(N); toc

N = uint64(2650266823); % The largest 64-bit prime
isprime_fast(N)
tic, isprime_fast(N); toc

% Elapsed time is 1.110915 seconds.

%TEST-3
% N = uint64(18446743979220271189); % 64-bit pseudoprime (4294967279 * 4294967291)
% %Elapsed time is 0.226019 seconds.
% tic, isprime_fast(N); toc

%Test 4
% num=bi2de(randi(2,1000,8)-1);

% count=0;
% for N=intmax('uint64'):-1:9999999999999999999 %9223372036854775808
%     
%     tic,if(isprime_fast(N)),toc
%         N
%         count=count+1;
%         if(count==4)
%             break;
%         end
%     end
% end

end