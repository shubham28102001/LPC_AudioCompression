function s = lpcCompress(file) 
clc;
%% load audio
[x, fs] = audioread(file);
x = mean(x, 2); % mono
x = 0.9*x/max(abs(x)); % normalize
x = resample(x, 8000, fs);% resampling to 8kHz
fs = 8000;
w = hann(floor(0.03*fs), 'periodic'); % using 30ms Hann window

%% encode 
p = 12; % using pth order
[A, G] = encode(x, p, w);


%% decode
xhat = decode(A, G, w);


%% saving predicted audio
s1 = split(file,'.');
s1 = string(s1(1,1));
s = strcat(s1,strcat('_',num2str(p)));
s = strcat(s,'.wav');
audiowrite(s,xhat, fs);
end