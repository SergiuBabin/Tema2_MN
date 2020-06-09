function [m A eigenfaces pr_img] = eigenface_core(database_path)
  
  for i = 1 : 10
    image_path = strcat(database_path,'/',int2str(i),'.jpg');
    C = double(rgb2gray(imread(image_path)));
    T(:,i) = C(:);
  end
  m = zeros(10000,1);
  [p q] = size(T);
  for i = 1 : p
    m(i,1) = sum(T(i,:))/10;
  end
  
  A = T - m;
  Z = A' * A;
  [V x] = eig(Z);
  for i = 1 : 10 
    if(x(i,i) < 1 ) 
      V(:,i) = [];
    end
  end
  eigenfaces = A * V;
  [p q ] = size(eigenfaces);
  
  pr_img = eigenfaces' * A;
  
end