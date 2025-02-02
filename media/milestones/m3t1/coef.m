% Script to format filter coefficients in 'C' arrays
% Input:
%   FIR filter coefficients saved as a .mat file.
%     FIR_b is a 1xN vector of single-precision floating-point values.
%   IIR filter coefficients saved as a .mat file.
%     IIR_sos is an F element cell array of S x 6 single-precision matrices.
%     F is the number of IIR filters, one for each player frequency.
%     S is the number of second-order sections in the filter.
%     Each section contains 6 coefficients {b0, b1, b2, 1, a1, a2}.
% Output:
%   coef.h header file with array declarations
%   coef.c C file with initialized arrays

%%%%%%%%%%%%%%%%%%%% Clear Everything %%%%%%%%%%%%%%%%%%%%
clc, clear, close all;

%%%%%%%%%%%%%%%%%%%% Load FIR Filter %%%%%%%%%%%%%%%%%%%%
load("FIR_b.mat");

%%%%%%%%%%%%%%%%%%%% Load IIR Filters %%%%%%%%%%%%%%%%%%%%
load("IIR_sos.mat");

%%%%%%%%%%%%%%%%%%%% Write .h File %%%%%%%%%%%%%%%%%%%%
fid_h = fopen('coef.h', 'w');
fprintf(fid_h, '#ifndef COEF_H_\n');
fprintf(fid_h, '#define COEF_H_\n\n');

fprintf(fid_h, '#define FIR_B_COEFS %u\n\n', length(FIR_b));
fprintf(fid_h, 'extern const float fir_b[FIR_B_COEFS];\n\n');

% Drop (4th column) A coefficients equal to one
fprintf(fid_h, '#define IIR_FILTERS %u\n', length(IIR_sos));
fprintf(fid_h, '#define IIR_SOS_SECTS %u\n', size(IIR_sos{1},1));
fprintf(fid_h, '#define IIR_SOS_COEFS %u\n\n', size(IIR_sos{1},2)-1);
fprintf(fid_h, 'extern const float iir_sos[IIR_FILTERS][IIR_SOS_SECTS][IIR_SOS_COEFS];\n\n');

fprintf(fid_h, '#endif // COEF_H_\n');
fclose(fid_h);

%%%%%%%%%%%%%%%%%%%% Write .c File %%%%%%%%%%%%%%%%%%%%
fid_c = fopen('coef.c', 'w');

fprintf(fid_c, '#include "coef.h"\n\n');

fprintf(fid_c, 'const float fir_b[FIR_B_COEFS] = {\n');
for i = 1:length(FIR_b)
    fprintf(fid_c, ' %14.7e,', FIR_b(i));
    if rem(i,5) == 0 && i ~= length(FIR_b)
        fprintf(fid_c, '\n');
    end
end
fprintf(fid_c, '\n};\n\n');

% Drop (4th column) A coefficients equal to one
fprintf(fid_c, 'const float iir_sos[IIR_FILTERS][IIR_SOS_SECTS][IIR_SOS_COEFS] = {\n');
for i = 1:length(IIR_sos)
    sos = IIR_sos{i};
    fprintf(fid_c, '{\n');
    for r = 1:size(IIR_sos{1},1)
        fprintf(fid_c, '{%14.7e, %14.7e, %14.7e, %14.7e, %14.7e},\n', ...
            sos(r,1), sos(r,2), sos(r,3), sos(r,5), sos(r,6));
    end
    fprintf(fid_c, '},\n');
end
fprintf(fid_c, '};\n');

fclose(fid_c);
