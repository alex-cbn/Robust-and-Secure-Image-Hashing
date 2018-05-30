function vlad_testPlace()
%VLAD_TESTPLACE Summary of this function goes here
%   Detailed explanation goes here

    %load configuration
    config;

    [~, ~, ~, ~, ~, fpcimg1] = vlad_preprocStage('1.png');
    %key based feature generation
    [rho_length, ~] = size(fpcimg1);
    
    %beta based on a key
    beta1 = get_rbytes('asdf1234', rho_length, K);
    h1_img1 = vlad_schema1(fpcimg1, beta1, K);

    h1_img1 = quant_norm(h1_img1, 8);
    %h1_img1 = bin2gray(h1_img1, 'fsk', 2^8);
   
    
    [~, ~, ~, ~, ~, fpcimg2] = vlad_preprocStage('2.png');
    %key based feature generation
    [rho_length, ~] = size(fpcimg2);

    %beta based on a key
    beta2 = get_rbytes('asdf1234', rho_length, K);
    h1_img2 = vlad_schema1(fpcimg2, beta2, K);
    
    h1_img2 = quant_norm(h1_img2, 8);
    %h1_img2 = bin2gray(h1_img2, 'fsk', 2^8);
    
    %rez1 = hammingdistance(h1_img1, h1_img2);   
    D = vlad_hamming(h1_img1, h1_img2, 8);   
end

