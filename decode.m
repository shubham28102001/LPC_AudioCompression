%
% Decodes the LPC coefficients.
%
% A - LPC filter coefficients
% GFE - signal power(G) or the signal power with fundamental frequency(GF) 
%       or the full source signal(E) of each windowed segment.
% w - window function
%
function xhat = decode(A, GFE, w)

[ne, n] = size(GFE);
nw = length(w);

% synthesize estimates for each chunk
Xhat = zeros(nw, n);

% GFE is only the signal power
for i = 1:n
        src = randn(nw, 1); % noise
        Xhat(:,i) = w .* filter( 1, [-1; A(:,i)], sqrt(GFE(i))*src);
end
    
% render down to signal
xhat = stackPress(Xhat);
    