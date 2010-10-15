function result = PSNR(f, g)
	assert(max(max(f)) <= 255);
	result = 10*log10(255*255/MSE(f,g));

function result = MSE(f, g)
	assert(size(f)==size(g));
	result = double(sum(sum( (f-g) .^ 2 ))) / ( rows(f)*columns(f) );
