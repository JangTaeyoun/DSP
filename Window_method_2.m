% FIR 대역통과 필터 설계 - 창 함수법

% 필터 사양
fs = 16000;    % 샘플링 주파수
N = 60;        % 필터 차수
fc1 = 3000;    % 통과대역 하한
fc2 = 5000;    % 통과대역 상한

% 주파수 정규화 (0~1)
fp1 = fc1 / (fs/2);
fp2 = fc2 / (fs/2);

% Hamming 창을 사용한 대역통과 필터 설계
b_win = fir1(N, [fp1 fp2], hamming(N+1));

% 주파수 응답 시각화
figure;
freqz(b_win, 1, 1024, fs);
title('FIR 대역통과 필터 - 창 함수법 (Hamming)');
