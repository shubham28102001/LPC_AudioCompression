%
% Stacks signal into overlap-add chunks.
%
% x - single channel input signal
% w - window function
%
% X - overlap-add stack
%
function X = stackOverlapadd(x, w)

n = length(x);

nw = length(w);
step = floor(nw*0.5);

count = floor((n-nw)/step) + 1;

X = zeros(nw, count);

for i = 1:count
    X(:, i) = w .* x( (1:nw) + (i-1)*step );
end
