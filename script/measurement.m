clc;
clear all;
close all;

%% SET UP THE DAQ DEVICE
% Interface with the ni USB 4431
% Set up a Mic with IEPE power
% Set up an output channel for the speaker
devices = daq.getDevices
s = daq.createSession('ni');
s.Rate = 44100;
addAnalogOutputChannel(s,'Dev2',0,'Voltage');
addAnalogInputChannel(s,'Dev2',0,'IEPE');


%% SET UP SIGNAL
% Set fs, N
% Create your sine sweep and averaging
fs = 44100;
dt = 1/fs;
T = 2; % legth of the sweep
N = T*fs; % sample number of one signal
t = (0:N-1)*dt; t=t';
f_1 = 20;
f_2 = 22000;

phi = 2*pi*f_1*((f_2/f_1).^(t./T)-1)*(T/log(f_2/f_1));
sin_sweep = sin(phi);
plot(sin_sweep)
%[C, f] = my_Spect(sin_sweep, 44100, 0.1, 0.4)

z = zeros(N,1); % concate zeros at the end for time decay 
signal_clip = vertcat(sin_sweep, z);
signal_f = [];
m_num = 10; %number of averaging

for i = 1:1:m_num
    signal_f = vertcat(signal_f, signal_clip);
end
t_f = (0:length(signal_f)-1)*dt;
plot(t_f, signal_f)

%% DO THE MEASUREMENT
% Interfacing with the 4431 
output_data = signal_f;
queueOutputData(s,output_data)
disp('measuring')
[captured_data,time] = s.startForeground();
disp('done')

%% PLOT (MAKING SURE THAT YOU ARE COLLECTING DATA)
figure(1)
plot(time, captured_data);
audiowrite('R9_capture.wav', captured_data,fs)
% soundsc(captured_data, fs)


%% ANALYSIS
% Get the average measurement and the resulting IR and FRF
% signal and response
[captured_data,~] = audioread('R3_capture.wav');
% synchronous averaging of the response, response_avg
 N = length(captured_data);
 N2 = length(signal_clip);
 n_avg = floor(N/N2); %how amny actual audio clip in one averaging clip 
 bin_size = N2;
        
for i = 1:1:n_avg
    data_clip(:,i) = captured_data((i-1)*bin_size+1:i*bin_size, :);
end
data_avg = mean(data_clip, 2);
plot(data_avg)
%audiowrite('R9_avg.wav', data_avg, fs);

response_fft = my_fft(data_avg, 44100);
signal_fft = my_fft(signal_clip, 44100);
FRF = response_fft./signal_fft;
plot(abs(FRF));

% Calculate the Impulse Response (IR)
IR = my_ifft(FRF, 44100);
plot(10*log10(IR.^2))
save('R9_IR.mat','IR');

%plot and save figure
[data,~] = audioread('R4_capture.wav');
t = (0:length(data)-1)*dt; t=t';
plot(t,data)
title('Captured Data at Receiver Position 4', 'fontsize',18)
xlabel('Time(s)', 'fontsize',16)

%% Octaveband Filtered IR and FRF
% Plot the Octave Band Filtered IR
load('R3_IR.mat', 'IR')
fc = [125, 250, 500, 1000, 2000, 4000]
fs = 44100;
IR_filt = []
for i=1:1:6
    [b, a] = butter(3, [1*fc(i)/sqrt(2)/(fs/2) 1*fc(i)*sqrt(2)/(fs/2)]);
    IR_filt(:, i) = filter(b, a, IR);
end
dt=1/fs;
t = (0:length(IR_filt)-1)*dt; t=t';
plot(t, 10*log10(IR_filt.^2))
save('R5_filt.mat', 'IR_filt')

% plot and save figure
load('R4_IR.mat', 'IR')
t = (0:length(IR)-1)*dt; t=t';
plot(t,IR)
title('Impulse Response at Receiver Position 4', 'fontsize',18)
xlabel('Time(s)', 'fontsize',16)

% plot and save figure
fc = [125, 250, 500, 1000, 2000, 4000]
load('R3_filt.mat', 'IR_filt')
t = (0:length(IR_filt)-1)*dt; t=t';
for i = 1:6
    subplot(3,2,i)
    plot(t,10*log10(IR_filt(:,i).^2))
    char_title = fc(:, i) + " Octave Band Impulse Response at Receiver Position 3"
    title(char_title,'fontsize',16)
    xlabel('Time(s)', 'fontsize',14)
    ylabel('dB (ref:max)', 'fontsize', 14)
    ylim([-150 50])
end

%% EDC for filtered IR
clear all
load('R5_filt.mat', 'IR_filt')
fs=44100
dt=1/fs;
t = (0:length(IR_filt)-1)*dt; t=t';
[EDC_curve,EDC_max] = EDC(IR_filt);
Decay = 10*log10(EDC_curve./EDC_max);
plot(t, 10*log10(EDC_curve./EDC_max))
legend('125Hz', '250Hz', '500Hz', '1000Hz', '2000Hz', '4000Hz')
title('Energy Decay Curve at Receiver Position 5', 'fontsize',18)
xlabel('Time(s)', 'fontsize',16)
ylabel('dB (ref:max)',  'fontsize',16)
%% Find RT
index = 6
sample = find(Decay(:,index)>-15.01 & Decay(:,index)<-14.99)
time = sample*dt




