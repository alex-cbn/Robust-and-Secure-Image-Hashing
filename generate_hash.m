function [ h1, h2 ] = generate_hash(i, password, features_count, radii_count, K, quantization_factor)
%GENERATE_HASH Generates hashes according to both schemes
%  

%autogrey
if size(i,3) == 3
    i = rgb2gray(i);
end

pcI = preprocess(i);

%FEATURES GENERATION
    beta = get_rbytes(password, K,K); % get rand bytes

    %Scheme 1
    h1 = scheme1(pcI, beta, features_count, K);
    %Scheme 2
    h2 = scheme2(pcI, beta, features_count, radii_count, K);

%POSTPROCESSING
    h1 = postprocess(h1, quantization_factor);
    h2 = postprocess(h2, quantization_factor);
    
end

