syms x y z
field = [2*y^2 3*x^2*y 4*z];
vars = [x y z];
curlEx = curl(field, vars);
% to put into workspace: (no ;)
% curl(field,vars)
% subs(curlEx, [x,y,z], [1,1,1])


















% syms x y z
% field = [2*x^2 3*y^3 4*z^4];
% vars = [x y z];
% div = divergence(field,vars);
% to put into workspace: (no ;)
% divergence(field,vars)
% subs(div, [x,y,z], [1,1,1])






