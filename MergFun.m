function Alpha = MergFun(Arg1,Arg2)

ER_a = Arg1;
ER_b = Arg2;
PhiRa = 9;%size(ER_a,1);
PhiRb = 9;%size(ER_b,1);
Phif = 246.^2;
Q = 100;
Df = 256.^2;
Lambda = (Df/(2*Q)) * ((log(Phif.^2)/PhiRa) + (log(Phif.^2)/PhiRb));
Alpha  = exp(-(ER_a - ER_b).^2./Lambda);
end

