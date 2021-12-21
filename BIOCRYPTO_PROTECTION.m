function BIOCRYPTO_PROTECTION
    clc;
    imgRead=imread('CASIA.tif');
    imgResize=imresize(imgRead,[100,100]);
    imgGray=rgb2gray(imgResize);
        
    img=double(imgGray);
    [row,colm]=size(img);
    
    original_array=img;
    
    for i=1:row
        for j=1:colm         
        encrypted_array(i,j)=sum(original_array(:,j))-original_array(i,j);
        end
    end
    encrypted_array;
         
        
    for i=1:row
     for j=1:colm         
        decrypted_array(i,j)=sum(encrypted_array(:,j))/(row-1)-encrypted_array(i,j);
     end
    end
    decrypted_array;
    
%     size(decrypted_array)
%     size(encrypted_array)
    
    save('Original array.mat','original_array');
    imwrite(uint8(original_array),'img1.jpg');
    figure; imshow(uint8(img));title('Original image');

    save('Encrypted array.mat','encrypted_array');
    encrypted_array=mod(encrypted_array,10);
    encrypted_array=encrypted_array.*20;
    
    encr_array=reshape(encrypted_array,100,100);
    imwrite(uint8(encr_array),'img2.jpg');
    figure; imshow(uint8(encr_array')); title('Encrypted image');
 
    
    save('decrypted_array.mat','decrypted_array');
    decr_array=reshape(decrypted_array,100,100);
    imwrite(uint8(decr_array),'img3.jpg');
    figure; imshow(uint8(decr_array));title('Decrypted image');
end

%     D_array=bi2de(D_array);
%     D_array=D_array';
% % CONVERT 1D TO 2D
% %1D TO 2D
%     j=1;
%     for i=1:row
%         D(i,1:colm)=D_array(:,j:j+colm-1);
%         j=j+colm;
%     end
%     A
