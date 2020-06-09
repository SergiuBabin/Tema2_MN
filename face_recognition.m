function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
 X = double(rgb2gray(imread(image_path)));
 [p q ] = size(pr_img);
 test = X(:);
  test = test - m ;
 prtestimg = eigenfaces' * test;
 min_dist = norm(pr_img(:,1)-prtestimg);
 output_img_index = 1 ;
 for i = 2 : p
   min = norm(pr_img(:,i) - prtestimg);
   if min < min_dist
     min_dist = min;
     output_img_index = i
   end
 end
 
 
  




end