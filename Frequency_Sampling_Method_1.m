% FIR 저역통과 필터 설계 - 주파수 샘플링법

% 필터 사양
fs = 8000;              % 샘플링 주파수 (Hz)
N = 50;                 % 필터 차수 (계수 개수는 N+1 = 51)
fc_pass = 1200;         % 통과대역 경계
fc_stop = 1800;         % 차단대역 시작

% 정규화 주파수 계산
wp = fc_pass / (fs/2);  % 통과대역 정규화
ws = fc_stop / (fs/2);  % 차단대역 정규화

% 이상적인 주파수 응답 정의
H = zeros(1, N+1);                 % 주파수 응답 초기화
fp = floor(wp * (N+1));            % 통과대역 경계 인덱스 계산
H(1:fp+1) = 1;                     % 통과대역 설정
H(end-fp+1:end) = 1;               % 대칭성 보장 (실수 계수 필터용)

% 시간 영역 필터 계수로 변환 (IDFT)
b_freq = real(ifft(H));            % 복소수 제거
b_freq = fftshift(b_freq);         % 중심 정렬

% 주파수 응답 시각화
figure;
freqz(b_freq, 1, 1024, fs);
title('FIR 저역통과 필터 - 주파수 샘플링 설계법');
