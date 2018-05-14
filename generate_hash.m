function [ h1, h2 ] = generate_hash(i, password)
%GENERATE_HASH Generates hashes according to both schemes
%  

%autogrey
if size(i,3) == 3
    i = rgb2gray(i);
end

pcI = preprocess(i);

%FEATURES GENERATION
    K=360;
    beta = get_rbytes(password, K,K); % get rand bytes

    %Scheme 1
    h1 = scheme1(pcI, beta);
    %Scheme 2
    h2 = scheme2(pcI, beta);

%POSTPROCESSING
    h1 = postprocess(h1);
    h2 = postprocess(h2);
    
end

