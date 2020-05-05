function [out] = testfunc7(R)
    [Np, Nd] = size(R);
    Z = repmat((1:Nd), Np, 1) .* R .^ 4;
    out = sum(Z, 2) + rand(Np, 1);

end

