function numHSIC = HSIC(W1, W2)
K1 = W1 * W1';
K2 = W2 * W2';
[m,~] =size(W1);
Hn=H(m);
numHSIC = sum(diag(K1*Hn*K2*Hn));
end