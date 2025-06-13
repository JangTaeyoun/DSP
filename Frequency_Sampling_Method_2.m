% FIR 대역통과 필터 설계 - 주파수 샘플링 설계법

% 필터 사양
fs = 16000;    % 샘플링 주파수
N = 60;        % 필터 차수
fc1 = 3000;    % 통과대역 하한
fc2 = 5000;    % 통과대역 상한

% 정규화 후 인덱스 계산
fp1 = fc1 / (fs/2);
fp2 = fc2 / (fs/2);
idx1 = floor(fp1 * (N+1));   % 통과대역 시작 인덱스
idx2 = ceil(fp2 * (N+1));    % 통과 대역 끝 인덱스

% 주파수 응답 생성
H = zeros(1, N+1);
H(idx1:idx2) = 1;   % 통과대역 설정
H(end-idx2+2:end-idx1+2) = 1;  % 대칭 처리 (실수 필터용)

% 시간 영역 필터 계수
b_freq = real(ifft(H));
b_freq = fftshift(b_freq);

% 주파수 응답 시각화
figure;
freqz(b_freq, 1, 1024, fs);
title('FIR 대역통과 필터 - 주파수 샘플링 설계법');
