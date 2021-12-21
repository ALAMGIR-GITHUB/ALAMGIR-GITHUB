function BIOCRYPTO_CIRCUIT
    clc;
    imgRead=imread('FERET.TIF');
    imgResize=imresize(imgRead,[100,100]);
    imgGray=rgb2gray(imgResize);
        
    figure;imshow(imgGray);
         
    [row,colm]=size(imgGray);
    A=imgGray(1:row/2,1:colm);
    B=imgGray(row/2+1:row,1:colm);
    
    K=randi([0,255],row/2,colm);
    K=uint8(K);
    
    [C,A1,B1]= ENCRYPTION(A,B,K);
    figure;imshow(C);
    [decr]=DECRYPTION(C,A1,B1,K);
    figure;imshow(decr);
    
end


function[C,A1,B1]= ENCRYPTION(A,B,K)
    A1=bitxor(A,K);
    B1=bitxor(B,K);
    C=bitxor(A1,B1);
%     D=[A1;B1];
end

function[decr]=DECRYPTION(C,A1,B1,K)
    A2=bitxor(C,B1);
    B2=bitxor(C,A1);
 
    A=bitxor(A2,K);
    B=bitxor(B2,K);
    decr=[A;B];
end

