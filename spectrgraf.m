pkg load signal
s=600;
 figure; 
 %specgram(wavread('C:/Users/Ramzes 1/Documents/octava/work/zvuk.wav'), 2205, 22050)
 specgram(k(1+22050*s:1000000+22050*s), 2205, 22050)
colorbar