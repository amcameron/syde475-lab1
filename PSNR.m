function result = PSNR(f, g)
	assert(max(max(f)) <= 255);
	result = 10*log10(255*255/MSE(f,g));

function result = MSE(f, g)
	assert( rows(f)==rows(g) && columns(f)==columns(g) );
	result = sum(sum( (f-g) .^ 2 )) / ( rows(f)*columns(f) );
