%% Compute the L_{2,1}-norm of matrix X
%
% 
function a = L21(X)
%
% Input:
% X: matrix (d x n) (x1', ..., xn')'
%
% Output:
% a = ||x1||_{2} + ... + ||xn||_{2}

a = sum(sqrt(sum(X.*X,2)));

end
    