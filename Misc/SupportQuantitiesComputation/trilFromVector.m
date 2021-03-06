function v = trilFromVector(x,d)
v = tril(ones(d));
v(v > 0) = x;
L = (v + v')./(eye(d)+1);
end

