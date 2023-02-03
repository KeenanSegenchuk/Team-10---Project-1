info = audiodevinfo;
ID = 2;

% info.input(1)
% info.input(2)
% info.input(3)

recorder = audiorecorder(44100, 16, 1, ID);

disp("Say: The quick brown fox jumps over the lazy dog.")
duration = 6;
recordblocking(recorder, duration);
disp("Stop speaking.")

rad1 = getaudiodata(recorder);
ad1 = audioread("p1mono.wav");

disp("Say: We promptly judged antique ivory buckles for the next prize.")
recordblocking(recorder, duration);
disp("Stop speaking.")

rad2 = getaudiodata(recorder);
ad2 = audioread("p2mono.wav");

disp("Say: Crazy Frederick bought many very exquisite opal jewels.")
recordblocking(recorder, duration);
disp("Stop speaking.")

rad3 = getaudiodata(recorder);
ad3 = audioread("p3mono.wav");

plot(linspace(0, duration, size(rad1, 1)), rad1, "r");
hold on
plot(linspace(0, duration, size(rad2, 1)), rad2, "g");
hold on
plot(linspace(0, duration, size(rad3, 1)), rad3, "b");

xlabel("time");
ylabel("volume");

xlim([1 6]);

legend({"Phrase 1" ; "Phrase 2" ; "Phrase 3"})

window = hamming(512);
N_overlap = 256;
N_fft = 1024;
F_s = 44100;
[S,F,T,P] = spectrogram(rad1, window, N_overlap, N_fft, F_s, "yaxis");
figure;
surf(T, F, 10*log10(P),"edgecolor","none");
axis tight;
view(0,90);
colormap(jet);
set(gca, "clim", [-80, -20]);
ylim([0,8000]); xlim([1 6]);
xlabel('Time (s)'); ylabel("Frequency (Hz)");
title("the quick brown fox jumps over the lazy dog");

window2 = hamming(512);
N_overlap = 256;
N_fft = 1024;
F_s = 44100;
[S,F,T,P] = spectrogram(rad2, window2, N_overlap, N_fft, F_s, "yaxis");
figure;
surf(T, F, 10*log10(P),"edgecolor","none");
axis tight;
view(0,90);
colormap(jet);
set(gca, "clim", [-80, -20]);
ylim([0,8000]); xlim([1 6]);
xlabel('Time (s)'); ylabel("Frequency (Hz)");
title("we promptly judged ivory buckles for the next prize");

window3 = hamming(512);
N_overlap = 256;
N_fft = 1024;
F_s = 44100;
[S,F,T,P] = spectrogram(rad3, window3, N_overlap, N_fft, F_s, "yaxis");
figure;
surf(T, F, 10*log10(P),"edgecolor","none");
axis tight;
view(0,90);
colormap(jet);
set(gca, "clim", [-80, -20]);
ylim([0,8000]); xlim([1 6]);
xlabel('Time (s)'); ylabel("Frequency (Hz)");
title("crazy Frederick bought many very exquisite opal jewels");

window4 = hamming(512);
N_overlap = 256;
N_fft = 1024;
F_s = 44100;
[S,F,T,P] = spectrogram(ad1, window, N_overlap, N_fft, F_s, "yaxis");
figure;
surf(T, F, 10*log10(P),"edgecolor","none");
axis tight;
view(0,90);
colormap(jet);
set(gca, "clim", [-80, -20]);
ylim([0,8000]); xlim([1 6]);
xlabel('Time (s)'); ylabel("Frequency (Hz)");
title("the quick brown fox jumps over the lazy dog");

window5 = hamming(512);
N_overlap = 256;
N_fft = 1024;
F_s = 44100;
[S,F,T,P] = spectrogram(ad2, window2, N_overlap, N_fft, F_s, "yaxis");
figure;
surf(T, F, 10*log10(P),"edgecolor","none");
axis tight;
view(0,90);
colormap(jet);
set(gca, "clim", [-80, -20]);
ylim([0,8000]); xlim([1 6]);
xlabel('Time (s)'); ylabel("Frequency (Hz)");
title("we promptly judged ivory buckles for the next prize");

window6 = hamming(512);
N_overlap = 256;
N_fft = 1024;
F_s = 44100;
[S,F,T,P] = spectrogram(ad3, window3, N_overlap, N_fft, F_s, "yaxis");
figure;
surf(T, F, 10*log10(P),"edgecolor","none");
axis tight;
view(0,90);
colormap(jet);
set(gca, "clim", [-80, -20]);
ylim([0,8000]); xlim([1 6]);
xlabel('Time (s)'); ylabel("Frequency (Hz)");
title("crazy Frederick bought many very exquisite opal jewels");

audiowrite("p1mono.wav", rad1, F_s);
audiowrite("p2mono.wav", rad2, F_s);
audiowrite("p3mono.wav", rad3, F_s);

stereo = [ad1, permute(linspace(0, duration, size(ad1, 1)), [2 1])];
audiowrite("team10-stereosoundfile.wav", stereo, F_s);
