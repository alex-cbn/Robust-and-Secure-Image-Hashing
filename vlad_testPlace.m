function vlad_testPlace( )
%VLAD_TESTPLACE Summary of this function goes here
%   For test purpose only

    %Img1
    %preprocessing image stage
    [~, ~, ~, ~, ~, fpcimg] = vlad_preprocStage('img1_test.PNG');
    
    %key based feature generation
    [rho_length, ~] = size(fpcimg);
    K = 360; %doc says
    %beta based on a key
    beta = generate_beta('holla', rho_length, K);
    h = vlad_schema1(fpcimg, beta);

    %postProcessing
    precision = 16;
    %quantize the resulting vector
    h_quant = quant_norm(h, precision - 1);
    %get the gray code
    h_bin_grayCode_1 = vlad_grayCode(h_quant, precision);
        
    %Img_3
    %preprocessing image stage
    [~, ~, ~, ~, ~, fpcimg] = vlad_preprocStage('lena_gray.bmp');
    
    h = vlad_schema1(fpcimg, beta);

    %postProcessing
    %quantize the resulting vector
    h_quant = quant_norm(h, precision - 1);
    %get the gray code
    h_bin_grayCode_2 = vlad_grayCode(h_quant, precision);
    
    
    hash1 = quant_norm(h_bin_grayCode_1, precision - 1);
    hash2 = quant_norm(h_bin_grayCode_2, precision - 1);
    max_value=max(hash1);
    hash1 = hash1/max_value;
    max_value=max(hash2);
    hash2 = hash2/max_value;
    
    d = hammingdistance(hash1, hash2);
    
    
%     m = 16;                             % Number of bits per symbol
%     n = size(h_bin_grayCode, 1);        % Codeword length
%     k = 32;                             % Message length   
%     
%     msg = gf(h_bin_grayCode', m);
%     [rxcode1, ~] = rsdec(msg,n,k);
%     
%     
%     %Img_3
%     %preprocessing image stage
%     [~, ~, ~, ~, ~, fpcimg] = vlad_preprocStage('img3_test.PNG');
%     
%     h = vlad_schema1(fpcimg, beta);
% 
%     %postProcessing
%     precision = 16;
%     %quantize the resulting vector
%     h_quant = quant_norm(h, precision - 1);
%     %get the gray code
%     h_bin_grayCode = vlad_grayCode(h_quant, precision);
%     
%     
%     m = 16;                             % Number of bits per symbol
%     n = size(h_bin_grayCode, 1);        % Codeword length
%     k = 32;                             % Message length   
%     
%     msg = gf(h_bin_grayCode', m);
%     [rxcode2, ~] = rsdec(msg,n,k);
%     
%     hash1 = gf2dec(rxcode1, 16, 69643);
%     hash2 = gf2dec(rxcode2, 16, 69643);
%     hash1 = quant_norm(hash1, precision - 1);
%     hash2 = quant_norm(hash2, precision - 1);
%     max_value=max(hash1);
%     hash1 = hash1/max_value;
%     max_value=max(hash2);
%     hash2 = hash2/max_value;
%     
%     d = hammingdistance(hash1, hash2);
%     
end

