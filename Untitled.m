C = 0;
error = 0;
error1 = 0;
for i = 1:10000
   phase_error = normrnd(0 , 20, settings.num_of_Antenna, 1);
   phase_error1 = mvnrnd(zeros(7,1),20^2 * eye(7));
   error = error + phase_error * phase_error';
   error1 = error + phase_error1 * phase_error1';a
   %B= exp(1j * 20 * pi * (phase_error/360) ) * exp(1j * 20 * pi * (phase_error/360) )';
   %C = C + B;
    
end
error/10000
error1/10000
C / 1000;
amplitude1 = unifrnd(0,7,7,1);
phase1 = unifrnd(0,2*pi,7,1);
w_k = amplitude1 .* exp(1j * phase1);

amplitude2 = unifrnd(0,6,7,1);
phase2 = unifrnd(0,2*pi,7,1);
w_l = amplitude2 .* exp(1j * phase2);

amplitude3 = unifrnd(0,0.01,7,1);
phase3 = unifrnd(0,2*pi,7,1);
h = amplitude3 .* exp(1j * phase3);
noise = 0.0001;
SINR =real((h' * w_k * w_k' * h)) / real((h' * w_l * w_l' * h + noise));
h1 = h .* exp(1j * 2 * pi * (phase_error/360) );
SINR1 = real(h1' * w_k * w_k' * h1) / real(h1' * w_l * w_l' * h1 + noise);

