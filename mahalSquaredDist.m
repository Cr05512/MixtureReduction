function ds = mahalSquaredDist(x,mu,P)

ds = (x-mu)' * inv(P) * (x-mu);

end

