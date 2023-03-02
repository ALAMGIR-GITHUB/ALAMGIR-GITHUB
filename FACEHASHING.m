function FACEHASHING
clc;
addpath('E:\GROUP E-BIOHASHING\BIOHASH_15_CONFERENCE_PAPER\large_scale_svm');
% str='E:\GROUP E-BIOHASHING\BIOHASH_11_BIO_CRYPTOGRAPHY\1_CASIA_V5_SRC_SPM\';  
% str='E:\GROUP E-BIOHASHING\BIOHASH_11_BIO_CRYPTOGRAPHY\2_CASIA_V5_CD_SPM\';   
% str='E:\GROUP E-BIOHASHING\BIOHASH_11_BIO_CRYPTOGRAPHY\3_CASIA_L1L2BCD\';     

% str='E:\GROUP E-BIOHASHING\BIOHASH_11_BIO_CRYPTOGRAPHY\10_FERET_SRC_SPM\';    
% str='E:\GROUP E-BIOHASHING\BIOHASH_11_BIO_CRYPTOGRAPHY\11_FERET_CD_SPM\';     
% str='E:\GROUP E-BIOHASHING\BIOHASH_11_BIO_CRYPTOGRAPHY\12_FERET_L1L2BCD_SPM\'; 

lambda = 0.1;
bits=[100 200 500];
nRounds=5;
sample=5;
subject=500;

label=load([str,'label.txt']);
mat=load([str,'SRC_SPM_FEATURE.txt']);

if(size(mat,1)>size(mat,2))
    mat1=mat.';
else
    mat1=mat;
end




for i=1:size(bits,2)
    feature=BIOCODE_UNIQUE(mat1,subject,sample,bits(i));   %mat1 is f and feature is g   
    feature=PURTABATION_UNIQUE(feature,subject,sample);    % here feature is g'
    feature=PURTABATION_UNIQUE2(feature,subject,sample);    % here feature is g''
    mat=myscale_lu(feature);
    RSA_ALGORITHM_FINAL(mat);
    
     crr=K_FOLD_CV_IDENTIFICATION(label,mat,nRounds,subject,sample,lambda)
     
     dlmwrite([str,'FACEHASHING RESULT OF 100 200 500 BITS','.txt'],crr,'-append');
     profsave(profile('info'),[str,'CBS TIME'])

end
end


function feature=BIOCODE_UNIQUE(mat,M,N,bit)
count1=1;
for i=1:M
    i
    seed=100+i;
    rng(seed);
    Q=ORTHO_RNG(seed,size(mat,2),bit);
    Q=myscale_lu(Q);
    size(Q);
    for j=1:N
        for k=1:size(Q,2)
            bio(k)=dot(Q(:,k),mat(count1,:)');  % Projection of Q and mat vectors i.e. f(B)
        end
        feature(count1,:)=bio                   %feature of matrix of each sample i.e. g=[g1,g2,...gm]
        count1=count1+1;
    end
end
end

function feature=PURTABATION_UNIQUE(mat,subject,sample)
t=200;
count=1;
for i=1:subject
    i
    seed=100+i+t;
    rng(seed);
    k=randperm(size(mat,2));
    for j=1:sample
        arr=mat(count,:);
        feature(count,:)=arr(k);
        count=count+1;
    end
end
end


function feature=PURTABATION_UNIQUE2(mat,subject,sample)
count=1;
t=200;
tt=789;
for i=1:subject
    i
    seed=100+i+t+tt;
%     seed=100+i;
    rng(seed);
    k=randperm(size(mat,2));

    for j=1:sample
        arr=mat(count,:);
        feature(count,:)=arr(k);
        count=count+1;
    end
end
end


function [acc,crr]= K_FOLD_CV_IDENTIFICATION(sc_label,sc_fea,nRounds,subject,sample,lambda,percent)
% if(size(sc_fea,1)>size(sc_fea,2))
%     sc_fea=sc_fea.';
% else
%     sc_fea=sc_fea;
% end

sc_fea=myscale_lu(sc_fea);
clabel = unique(sc_label);   % clabel indicates Class Label i.e. Y it contsins unique values i.e. clabel=[1 2 3....994]
nclass = length(clabel);     % nclass=length(clabel)=994



for ii = 1:nRounds
    fprintf('Round: %d\n', ii)
    
    tr_idx = [];
    ts_idx = [];

    for jj = 1:nclass                           %nclass=138
        idx_label = find(sc_label == clabel(jj));   
 
%         tr_idx = [tr_idx; idx_label(find([1:sample~=ii]))];
%         ts_idx = [ts_idx; idx_label(ii)];

        N=size(idx_label,1);
        mat1=false(N,1);
        mat1(1:round(percent/100*N))=true;
        mat1=mat1(randperm(N));

        tr_idx = [tr_idx; idx_label(mat1,:)];
        ts_idx = [ts_idx; idx_label(~mat1,:)];
        
    end
    size(tr_idx)
    size(ts_idx)
            
%     save([str1,'Training Index Label','.mat'],'tr_idx');
%     save([str1,'Testing Index Label','.mat'],'ts_idx');

    tr_fea = sc_fea(tr_idx,: );
    tr_label = sc_label(tr_idx);
    ts_fea = sc_fea(ts_idx,:);
    ts_label = sc_label(ts_idx);

    
    [w, b, class_name] = li2nsvm_multiclass_lbfgs(tr_fea, tr_label, lambda);
    [C,Y]= li2nsvm_multiclass_fwd(ts_fea, w, b,class_name);
    C=C';
    ts_label=ts_label';
    count=0;
    for i=1:size(C,2)
        if(C(i)==ts_label(i))
            count=count+1;
        end
    end
    
    
    acc(ii)=count/size(ts_label,2);
end
acc
crr=sum(acc)/nRounds

end