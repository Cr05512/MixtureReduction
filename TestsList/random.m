function gm = random(Nh,d,alpha,beta,delta,rngSeed)
    rng(rngSeed)
    gm = GMGen(Nh,d,alpha,beta,delta);
    
end

