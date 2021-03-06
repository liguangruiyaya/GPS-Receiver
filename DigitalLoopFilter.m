function [final_PLL_OP, final_FLL_OP, a, b] = DigitalLoopFilter(ap, ap2, x, y, T)
% DIGITAL LOOP FILTER: Second Order Digital Loop filter
%   DigitalLoopFilter function consists of two 2nd order filters, each for
%   PLL and FLL.
    %----------------------------------------------------------------------
    Bn = 10;
    wp = Bn/0.53;   % Loop filter natural radian frequency
    a2 = 0.02;      % second order coeff. term

    Bn2 = 10;
    wp2 = Bn2/0.53; % Loop filter natural radian frequency
    a22 = 0.02;     % second order coeff. term

    %fllAssist = T*y*(11/0.25);  % T * w0f * (Bn/0.25)
    [OP1, a] = Bilinear_Integrator(x, T, ap);
    [OP2, b] = Bilinear_Integrator(y, T, ap2);
    % a & b are the intermediate terms from the bilinear filters.

    final_PLL_OP = OP1*(wp)^2 + x*a2*wp;    
    final_FLL_OP = OP2*(wp2)^2 + y*a22*wp2;
end