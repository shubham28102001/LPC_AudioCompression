%
% Renders an overlap-add stack into the original signal
% assuming that the stacked signals are already windowed.
%
% X - stacked overlap-add
%
% x - rendered signal
%
function x = stackPress(X)

[nw, count] = size(X);
step = floor(nw*0.5);
n = (count-1)*step+nw;

x = zeros(n, 1);

for i = 1:count
   x( (1:nw) + step*(i-1) ) = x( (1:nw) + step*(i-1) ) + X(:, i);
end
