% FIR 저역통과 필터 설계 - 창 함수법

% 필터 사양
fs = 8000;              % 샘플링 주파수 (Hz)
N = 50;                 % 필터 차수 (계수 개수는 N+1 = 51)
fc_pass = 1200;         % 통과대역 경계
fc_stop = 1800;         % 차단대역 시작

% 정규화된 주파수 계산 
wp = fc_pass / (fs/2);  % 통과대역 정규화
ws = fc_stop / (fs/2);  % 차단대역 정규화
wc = (fc_pass + fc_stop) / 2 / (fs/2); % 컷오프: 중심값

% FIR 필터 설계 (Hamming 창 사용)
b_win = fir1(N, wc, hamming(N+1));

% 주파수 응답 시각화
figure;
freqz(b_win, 1, 1024, fs);
title('FIR 저역통과 필터 - 창 함수법 (Hamming)');