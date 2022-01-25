function gm = random(Nh,d,gamma,beta,delta,rngSeed)
    rng(rngSeed)
    gm = GMGen(Nh,d,gamma,beta,delta);
    
end

