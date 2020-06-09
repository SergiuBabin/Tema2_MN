function [A_k S] = task3(image, k) 
  A = double(imread(image));
  [m,n] = size(A);
  beta = zeros(m,1);
  for i = 1 : m 
    for j = 1 : n
      beta(i,1) = beta(i,1) + A(i,j);
    end
    beta(i,1) = beta(i,1) / n;
  end
  
  for i = 1 : m
    for j = 1 : n
      A(i,j) = A(i,j) - beta(i,1);
    end
  end
  Z = A'/(sqrt(n-1));
  
  [U S V] = svd(Z);
  W = V(1:m,1:k);

  Y = W' * A;
  A_k = W * Y;

  for i = 1 : m
    for j = 1 : n 
      A_k(i,j) = A_k(i,j) + beta(i,1);
    end
  end

endfunction