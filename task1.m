function A_k = task1(image, k)
 A = double(imread(image));
 [m,n] = size(A);
 A_k = zeros(m,n);
 U = zeros(m,m);
 S = zeros(m,n);
 V = zeros(n,n);
 [U S V] = svd(A);
 A_k = U(1:m,1:k) * S(1:k,1:k) * V(1:n,1:k)';
end