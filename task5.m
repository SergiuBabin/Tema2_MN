function task5(image)
  A = double(imread(image)); 
  [m,n] = size(A);
  k = [1:19 20:20:99 100:30:min(m,n)];
  [A_k S] = task3(image,k);
  
  figure(1);
  plot(diag(S));
  
  figure(2)
  sum = 0;
  for i=1:min(m,n)
    sum = S(i,i) + sum;
  end
  x = zeros(length(k),1);
  for i = 1 : length(k)
    for j = 1 : k(i)
      x(i) = S(j,j)+x(i);
    end
  end
  x = x/sum;
  plot(k,x);
  
  figure(3)
  r = zeros(length(k),1);
  for l = 1 : length(k)
    [ A_k,S] = task3(image,k(l));
    t = zeros(m,1);
    for i = 1 : m 
      for j = 1 : n 
        t(i,1) = t(i,1) + (A(i,j) - A_k(i,j))^2;
      end
    end
    for tr = 1 : m 
      r(l,1) = r(l) + t(tr,1);
    end
    r(l,1) = 1/(m*n) * r(l,1);
  end

  plot(k,r);

  figure(4)
  for i = 1 : length(k)
    r(i,1) = (2*k(i) + 1 )/n;
  end
  plot(k,r);

end