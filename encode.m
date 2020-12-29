%
% Encodes the input signal into lpc coefficients using 50% Overlap add
%
% x - single channel input signal
% p - order for lpc
% nw - length of window
% 
% A - coefficients
% G - the signal power
% E - the full source (error) signal
%
function [A, G, E] = encode(x, p, w)

X = stackOverlapadd(x, w); % stacking windowed signals
[nw, n] = size(X);

% encode
A = zeros(p, n);
G = zeros(1, n);
E = zeros(nw, n);
for i = 1:n
    [a, g, e] = lpc(X(:,i), p);
    A(:, i) = a;
    G(i) = g;
    E(2:nw, i) = e;
end