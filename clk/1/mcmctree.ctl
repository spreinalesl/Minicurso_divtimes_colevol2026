          seed = -1				* Seed number, type -1 to generate a random seed number
       seqfile = ../../data/concatenated.phylip	* Path to input sequence file (e.g., many alignments in a unique file)
      treefile = ../../data/startingTree.phy	* Path to input tree file including calibration points as node labels	
       outfile = out.log			* Path to log output file
      mcmcfile = mcmc.txt			* Path to output file with MCMC samples

         ndata = 5				* Number of partitions
       seqtype = 0				* 0: nucleotides; 1:codons; 2:AAs
       usedata = 1				* 0: no data (samp from prior); 1:seq likelihood; 2:approx likelihood (use in.BV); 3:out.BV
       clock = 1				* 1: global clock; 2: independent rates; 3: correlated rates

         model = 4				* 0:JC69, 1:K80, 2:F81, 3:F84, 4:HKY85. Pick 4 for nt, and 2 for aa 
         alpha = 0.5				* alpha for gamma rates at sites
         ncatG = 5				* No. categories in discrete gamma

     cleandata = 0				* remove sites with ambiguity data (1:yes, 0:no)?

       BDparas = 1 1 0.1 m			* birth, death, sampling
   kappa_gamma = 2 .2				* gamma prior for kappa
   alpha_gamma = 2 4				* gamma prior for alpha
   rgene_gamma = 2 20				* gamma prior for overall rates for genes
  sigma2_gamma = 1 10				* gamma prior for sigma^2 (for clock=2 or 3)

         print = 1				* avoid printing branch rates for now as the tree is very large 
    checkpoint = 1				* turn checkpointing on with 1, change to 2 if resume is required after a failed one where 1 was active
        burnin = 4000				* Number of iterations that will be discarded as part of burn-in
      sampfreq = 6				* Sampling frequency
       nsample = 20000				* Number of samples to be collected

* burnin, samplefreq, and nsample imply that a total burnin + (sampfreq * nsample) samples will be collected with mcmc
BayesFactorBeta = 1e-300
