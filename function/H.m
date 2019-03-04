function [ output_args ] = H(n)

 output_args=eye(n)-(1/n)*ones(n,1)*ones(1,n);

end

