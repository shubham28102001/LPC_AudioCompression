%
% An implementation of LPC.
% 
% x - a single channel audio signal
% p - polynomial order of the all-pole filter
%
% a - coefficients to the all-pole filter
% g - variance(power) of the source
% e - full error signal
%
function [a, g, e] = lpc(x, p)

N = length(x);

% form matrices
b = x(2:N);

xz = [x; zeros(p,1)];

A = zeros(N-1, p);
for i=1:p
    temp = circshift(xz, i-1);
    A(:, i) = temp(1:(N-1));
end

% solving for a
a = pinv(A)*b;

% calculating variance of errors
e = b - A*a;
g = var(e);

